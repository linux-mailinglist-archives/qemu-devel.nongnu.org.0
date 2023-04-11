Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005F6DDFD6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:40:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmG6R-0004tr-7p; Tue, 11 Apr 2023 11:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmG6M-0004tc-1g
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:40:10 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmG6G-0001AM-DN
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:40:06 -0400
Received: by mail-ej1-x631.google.com with SMTP id gb34so21672108ejc.12
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681227603; x=1683819603;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TBYdqTcK6wlO6G4bLTaDizHI/p+IgZlwmlhriAjwHBc=;
 b=Ext8fCgWNqDdakMaMnsRiWhsDL/MC2NQz5de9BhqZQdqXvrZZWUhyDuBp4kLDUnDs5
 G2+X8ReCSGeZhhZfJWCx+t4Gz+gNqOkk/i+tlnD5xTOVa0FHucllYgcO3p1WAX6ID7ff
 vfo1v+nFWviTVppsBi4pxgBBgEES0FStr7HqWGrVk9syXZRqnj0EIg1NspSBoEZ30BW7
 D/CSWdWOE9v7QAB1OQqh4NBPZI80S1+8nD/LxxfQWMFwBTReeH1WouY5+3oUxp6dF4AF
 Yfd0sS2ysp+bZ8Kv7Lf6QvztmcSfITs60CExtBeLcUqCRLjq50GKiu8N9s9LwOeHZBSW
 Zf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681227603; x=1683819603;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TBYdqTcK6wlO6G4bLTaDizHI/p+IgZlwmlhriAjwHBc=;
 b=CYZIavcDmQ5hvkVBwtp49hrsp8ml1E/YM52z0MfbKmVdD978vwdfI5jlXRW58Q1jhc
 VaNLJUAJ3I6sVQHiiQ3h86Chj2ZsnJZ3Lk3EMYpedBp5/742wSjXGoOGODsSDUdgiCYq
 kU1P/A/ph/Ba7a8tANqxbpu2O0YVuCXlLqPfCblSBg/fCChLVp80D8Ynj55qqjnpyuvt
 STpCr4VMOvZsJT2e37Qgv+itI0XJozlCSTjwia0edGEhvTTNfosLV2kS3wc6qI7CjnbD
 NimtJulKS/W5KqPzq+obwwDoGmNniuH9LBczZ9BA+FOrD6+84jsbPOQ2dyy661bbD7Ne
 SHbw==
X-Gm-Message-State: AAQBX9fkwxHBFmZ9PgNVh5bCaohbCTlIz5FSO3fHEpEc2OwoNJF8Dj9M
 2y/L7807UiyubhBKDCEgjDeOKltgIdvuv5bArCszbg==
X-Google-Smtp-Source: AKy350bJD9YbWRuWoLJ7cmpWP/xhj7bZawwIRQsmMYx1uHYVDFW3KlgDyr0E5bAqXeGUGYlc2tAMZU+75v6S+Wh6FI0=
X-Received: by 2002:a17:907:8b99:b0:924:efbb:8a8b with SMTP id
 tb25-20020a1709078b9900b00924efbb8a8bmr5737014ejc.6.1681227602772; Tue, 11
 Apr 2023 08:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230403084245.54861-1-zenghao@kylinos.cn>
In-Reply-To: <20230403084245.54861-1-zenghao@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 16:39:51 +0100
Message-ID: <CAFEAcA8c7F1WKx6_bpNiat967g2wF-KtWQwSwPVoLt-YCqYaWw@mail.gmail.com>
Subject: Re: [PATCH] Subject:[PATCH] cxl-cdat:Fix open file not closed in
 ct3_load_cdat
To: zenghao <zenghao@kylinos.cn>
Cc: jonathan.cameron@huawei.com, fan.ni@samsung.com, qemu-devel@nongnu.org, 
 xieming@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 3 Apr 2023 at 13:51, zenghao <zenghao@kylinos.cn> wrote:
>
> opened file processor not closed,May cause file processor leaks
>
> Fixes:aba578bdace5303a441f8a37aad781b5cb06f38c
>
> Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> Suggested-by: Xie Ming <xieming@kylinos.cn>
> ---
>  hw/cxl/cxl-cdat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> index 137abd0992..ba7ed1aafd 100644
> --- a/hw/cxl/cxl-cdat.c
> +++ b/hw/cxl/cxl-cdat.c
> @@ -128,6 +128,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
>
>      if (fread(cdat->buf, file_size, 1, fp) == 0) {
>          error_setg(errp, "CDAT: File read failed");
> +        fclose(fp);
>          return;
>      }

Coverity also spotted this, as CID 1508069.

The other bug in this code (CID 1507822) is that the
check on the return value of fread() is wrong. fread()
returns the number of items read or written, so
checking for == 0 only catches "no data read at all",
not "only read half the data". This check should be
 if (fread(cdat->buf, file_size, 1, fp) != file_size) {
    ...
 }
I think.

thanks
-- PMM

