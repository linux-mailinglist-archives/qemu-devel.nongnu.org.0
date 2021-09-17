Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9716840FB49
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:06:20 +0200 (CEST)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFRT-00045H-Nn
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRFP6-0002lZ-QB
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:03:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRFP3-0000Za-AY
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:03:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id t8so15701841wrq.4
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qM5kiNULW1v2c+xYqG4kJYOm0JZzUh7WqPcGkhMvE80=;
 b=VXwy0K0tu/DxDLBkAFfXKpbb4f4jh5SKjRhq6Gjh459HrfAPVzDhsFjExJyZix4h0Q
 y0zVkEh765bUOgA1cnBFU/LaxaEy82ZAw6oDSq3CGP7S1JviJ48tE8FwDUyVKh4doVpB
 4sNJq37lBdmghVFq/OFwlbUAC2znhd110dJmsauLFGSwd6FDYr2PsvDX5pFvOH5oaCI4
 63nh+FOj5ZrwtkbQGWKSA7GGpAReaq/8laGdJI//8uuccPPMoZM8yYy562GG6W3MIf+q
 Y+hQ+GOi7vzNSwew0fOu1W3tG5abf+IzT8GtNhODT/GA6T7lSrh76/Fo1+yc8sOIie2a
 IXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qM5kiNULW1v2c+xYqG4kJYOm0JZzUh7WqPcGkhMvE80=;
 b=pmqrh4iPoavLcrxtm1Q2uZ+Fh3kxMlVhfe87cELVj63z8lyqZxemYMgZXtAmODLDa7
 s5s2ome60IPTAkmsunaxgwT0QKwWHchUd7FXTk4ulVIrUVC318pt0atZa1+W8NPGJ5QO
 NQSdiefLOU2YyIXnFpwj/TdLtQKFTesaQshPiUoYcFx0sMvbs0ivKi6QIN/i6A9Pwlf6
 n1tbA7jfM1veMsb431lRRSdBD80BkNpvnOksFJsXBIU9ng02jz1gACfRYuNUNMNRJQ3Z
 065ocNSAAj66Zz8KOyax5oF5Q8vNV49QbDbV2Xod3QcqJgCVI0epGulor8xs9IbudmcR
 HabQ==
X-Gm-Message-State: AOAM533ST36NdsyLnGVasaMM1nW7/HYNsPb5yreamp64t/g2yFVKrbiY
 a9Bj0lr95GHCA8EPnsr0mps=
X-Google-Smtp-Source: ABdhPJxgKQBLPcgOJugjm4TtJZwAes1xH4oa1mDVoqAH8S9vQ4dfpsRXWH+QBtqBDgOw2SyBtVdTrw==
X-Received: by 2002:adf:f805:: with SMTP id s5mr12327578wrp.259.1631891027634; 
 Fri, 17 Sep 2021 08:03:47 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id r25sm7456385wrc.26.2021.09.17.08.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 08:03:46 -0700 (PDT)
Subject: Re: [PATCH 3/9] bsd-user: MAP_ symbols are defined, so no need for
 ifdefs
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210917025635.32011-1-imp@bsdimp.com>
 <20210917025635.32011-4-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <669f5945-d23c-befb-acb3-4a1da90e15b9@amsat.org>
Date: Fri, 17 Sep 2021 17:03:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917025635.32011-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 4:56 AM, Warner Losh wrote:
> All these MAP_ symbols are always defined on supported FreeBSD versions
> (12.2 and newer), so remove the #ifdefs since they aren't needed.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/mmap.c | 14 --------------
>  1 file changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

