Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B031B7B3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:58:42 +0100 (CET)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbaT-0001Uv-Ss
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbYj-0000aL-AO; Mon, 15 Feb 2021 05:56:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbYf-0003ck-RX; Mon, 15 Feb 2021 05:56:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id n4so5347588wrx.1;
 Mon, 15 Feb 2021 02:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/ddFKPEtA+bqBplywm4Eu0wtttSsmgjNCeWOYYFfoc0=;
 b=W4E1gI6/AnGQflTxYw+v+5WDi4u+6NJAZpyKggJzw7N4KuJq4O3u5z8MTYiClp6rB3
 l+pDixuZCfv0I13j5C44TsSAyYidPXSRNY7ymMD9aa3sw0pB25WPmmKhAoxEjd0DW38B
 rpu9PF6mwt8T/ohGlFrWxgi9yulVWBBMEaAa2md2OL4TrnzkuGlaVjUWVTxMFsgXULDU
 TL+oxzjVSnHE4OzCJOW5oqyM8isZg9YqaXecXR7yBT+DHCfDv05WsYWyRqFJZAMJQrsb
 g0jagjIGEB2p8XVj3uE26yDC9grMOiMDykZzuNyvPq/1OE7d7d0rPKhRY13wf5qPtoOx
 YDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/ddFKPEtA+bqBplywm4Eu0wtttSsmgjNCeWOYYFfoc0=;
 b=hfGmTPA2/P3vtfoFcTJZVq8TwyhBSjcLGmTP5LswZWhYdcssMFe4PvKylqSxiP15PY
 +p2y7GClOxptpFaGcPkf5TQ/C+WEIa8370SXI3GY3Fv+v842q5l/hQmP8+89ys+oSwhn
 g2Xc/+c4LfDQqK5baf40izhfTVr5wgkV9CH9CwBVw6jEIJCcLwARQMVIEEc4xXivHf9m
 +BCR9NU+goCcDP3AuXgb1l5bGnYYel+GbXAI7V5Di9Pyf7lRVB1j6FBtCIOljMDovU4f
 2oPMxTH/apPKXszFpjAnbahM2mfwQ4D4aQnlmVbqLVRyr0eyDYeJchtZnPFQ/A/ans9V
 BXyA==
X-Gm-Message-State: AOAM533c4JqI5e9nUviWrgWQyMEcNAxBnb5LAlriMkualykLGCb+X+Ad
 CKhaNdwjQRp6NG04GnfmaOo=
X-Google-Smtp-Source: ABdhPJy3yf1f6LYlKHfhx1zcwS7f9UXzbuPeSRYkO93puL44hDt7xYuXrDZUrHxGDrTGng1PI4t0qA==
X-Received: by 2002:a05:6000:10c5:: with SMTP id
 b5mr18526029wrx.284.1613386607926; 
 Mon, 15 Feb 2021 02:56:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g15sm23330215wrx.1.2021.02.15.02.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 02:56:47 -0800 (PST)
Subject: Re: [PATCH 4/9] hw/display/tc6393xb: Inline tc6393xb_draw_graphic32()
 at its callsite
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215103215.4944-1-peter.maydell@linaro.org>
 <20210215103215.4944-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a4619fc8-0d6f-bcae-e938-fc1f63bdce9e@amsat.org>
Date: Mon, 15 Feb 2021 11:56:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215103215.4944-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 11:32 AM, Peter Maydell wrote:
> The function tc6393xb_draw_graphic32() is called in exactly one place,
> so just inline the function body at its callsite. This allows us to
> drop the template header entirely.
> 
> The code move includes a single added space after 'for' to fix
> the coding style.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/tc6393xb_template.h | 45 ----------------------------------
>  hw/display/tc6393xb.c          | 23 ++++++++++++++---
>  2 files changed, 19 insertions(+), 49 deletions(-)
>  delete mode 100644 hw/display/tc6393xb_template.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

