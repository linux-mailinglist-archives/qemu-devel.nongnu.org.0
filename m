Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2794B653A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:09:03 +0100 (CET)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJstS-0004ao-Je
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:09:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsmu-00010q-SU
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:02:16 -0500
Received: from [2607:f8b0:4864:20::102a] (port=36576
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsms-000249-H5
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:02:16 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso1970517pjd.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SQ2Iws9Bqt7scpOW8LYS27BaBorGqDB7xyOf3jRsqqE=;
 b=BEM3vVE22Y4gtJyrqxsjcBajlXK0//1TZeZJiJJh+zJ3jid33W7NRc21hbYYjhNuTK
 kWG0S03vL0aA6RveiWIdh6Z+7/ovVJz/cpQ5dJAMgWTcCC6IxG6ZiqBO3UW1hJoIEgvx
 lzcU/EkDDwvqiaVUk4HBHxt3xpZKXKMlqxw/soIvt+R5V+38UG0GXeQ8ofRzBE5l+ByW
 t4VBoTcKdVZBuLxWvYyCRNYWA5pXHxMuCA64VN2ncXcstvCldeybKWPmehufIYmmJ71/
 fAuEpHQYaS8KrDlAOwnkHdmQ7ydxECT3xsFSbM8eaSC6MP5T1ugwZsvliVsnjMB0cdyi
 FVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SQ2Iws9Bqt7scpOW8LYS27BaBorGqDB7xyOf3jRsqqE=;
 b=MFaUjyGKIdpDobFHmgNwyhOMGmYnHgCDfMUHITj8BPqEmm2JU0eTq0WHTAA2ka62q0
 60bHgWXvxxmsqYdn+F+06piNwRXiiTQasRtA/2NURXXx1a1Su7NxWmHta733r1K/b74I
 poK5/S9+1BKL9s9E2wAQOVN62pR23bd+2udXpfTZlAjlEyHI+P/Ju5w04yT2SS4EI0Tk
 /HFwa34zw9Joa5jdEk9S6UqzQZ16uTvx2nT9Wx+ADDPZSyYrQRZtfCp2RiXlVdMgDvyo
 Ma/djv3MmCMFGwpC1mPlYCMkFKeaS081R7MOOXWsWJpkwl6M7SkWGb4tf3X3JCVLE8WS
 PUoA==
X-Gm-Message-State: AOAM530Jiooen4AKjXfmhlp59v4KA37eYjHId29cLjv/lKejftfmHB9n
 duCEsCBrHJq3VIwB/mgPAZw=
X-Google-Smtp-Source: ABdhPJySIopm5aPfAWMdyvXCzdZFWxkeUN2Q6Bfc4HcIGUF0ZCWXGHFxDzzfPK26WyIulEz9oJRmEA==
X-Received: by 2002:a17:90b:388a:: with SMTP id
 mu10mr3008904pjb.207.1644912132924; 
 Tue, 15 Feb 2022 00:02:12 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id x34sm2288557pfh.178.2022.02.15.00.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 00:02:12 -0800 (PST)
Message-ID: <dbe1e142-30f4-59b5-9f49-48edddd84deb@amsat.org>
Date: Tue, 15 Feb 2022 09:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] ui/cocoa: Fix the leak of qemu_console_get_label
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220213021329.2066-1-akihiko.odaki@gmail.com>
 <42c9885-3012-3b4b-a97e-c78aaa3d6d8b@eik.bme.hu>
In-Reply-To: <42c9885-3012-3b4b-a97e-c78aaa3d6d8b@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/2/22 12:11, BALATON Zoltan wrote:
> On Sun, 13 Feb 2022, Akihiko Odaki wrote:
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> ---
>> ui/cocoa.m | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>> index ac18e14ce01..fdf52a7c2f7 100644
>> --- a/ui/cocoa.m
>> +++ b/ui/cocoa.m
>> @@ -1680,7 +1680,10 @@ static void create_initial_menus(void)
>> /* Returns a name for a given console */
>> static NSString * getConsoleName(QemuConsole * console)
>> {
>> -    return [NSString stringWithFormat: @"%s", 
>> qemu_console_get_label(console)];
>> +    char *label = qemu_console_get_label(console);
> 
> I guess you could do g_autofree char *label to save a g_free but not a 
> big deal and only saves one line here so it's also good as it is.

Good idea.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

