Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C03A6BD6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:31:47 +0200 (CEST)
Received: from localhost ([::1]:53102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspV4-00078s-87
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lspTJ-0006DE-SP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:29:57 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lspTG-0006SP-8F
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:29:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id m3so7252126wms.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pEN/JERdo3dr1OtAT4wHFokDy9niXHLf4vAybNjJYvg=;
 b=lk6mYyosvEv971EnWwJ7Mu9pUW3pTfgqEhPDKpCMTRxks3U1S9gFiRJlEt80E0wJct
 pElj37aUP3eHabzaIHIIveLowGslKwFFf3ofE2ovyblJXrMSRVr7nQC7XuMyrRekyifH
 BzZrcD+yVSCL3U8Z+UyvuHsR+/j6r3k2a0HEav32uOkZewInEf99F0gvQxOV7I3/Xd2p
 /UtscpfaXuD1jaYXTa+6H5VxOJHYxfT3v99C9fwDw6mufa8Gn4ZLdMXs/yMT/kWlfHvM
 NIvzp5d70PG/YsMbLI5AO6KXotP5AdFa1LuSpHPjmWHygwqq7V+94Qgf0V0V2nG1r9q6
 eCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pEN/JERdo3dr1OtAT4wHFokDy9niXHLf4vAybNjJYvg=;
 b=BY+BctIwpUbGrma8H9YNeXA16YNcoupgYI6g1SsTaPi9i1vQR55QPEUU+/vfH9+QW7
 9ZIKjmAKd31HGbNQTVkTyl6WETI3Kfs1yWVCL9w3gSMRnKIovODdGf2UEtQ2DNQ+jm8u
 Wikr+gm4pQemtoHualcyinn/GEbZ/UQp+fgIOyEXfhE1lSeeGlnCd7DJSS9Kf44pikbL
 n1sOBKsTJMHPN1tifLYKIe7Mg9qbEEVVuSOGQA1uK+EnabqF6F54bzOLqjhmxEfsBS1U
 njk5pZC7wlZnCMNeeL7dpCooz7aRQRPUdE89QVMZdXq5TJPRqEubi5ET+SaNJM/Fsgu2
 7tGQ==
X-Gm-Message-State: AOAM531ILMTYUTq4I57Cdb0l9xNt+oE1oZ0/uogdt1mJKuAcPwAkyzRE
 ej/oajOHHtJu5bYLravc5MA=
X-Google-Smtp-Source: ABdhPJwGiTcGaBfkHjbcf2tnc6UT/t4Nw1uSS3njA3UUSip51RD4PrZoIIH5ky8DVqEG/FHiSHRnqg==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr17515790wmq.116.1623688191324; 
 Mon, 14 Jun 2021 09:29:51 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e27sm17790657wra.50.2021.06.14.09.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 09:29:50 -0700 (PDT)
Subject: Re: [gitlab] Renamed issue labels for target architecture
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9b0849bd-20d0-9f72-01bb-ffb60cad575b@amsat.org>
Date: Mon, 14 Jun 2021 18:29:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/21 12:32 AM, Richard Henderson wrote:
> I've renamed arch:* to target:* as there was some amount of confusion as
> to what "arch" really meant without context.

There was a discussion with jsnow about that on IRC, and IIRC he
said what first matters to have easy tags so the reporter does the
first triage directly.

>  I've removed labels for
> lm32 and unicore32 which have been removed from qemu 6.1.  I've added a
> label for hexagon.
> 
> I have not yet added labels for host architecture, because I couldn't
> figure out how best to word the description, or even if all of the
> target:* labels need re-wording to emphasize target.

We want to have a first label to quicker triage. Once a
maintainer is notified, different/finest triage can be done.

The downside is this is noisier for maintainers :(

Wait, are you seeing labels are a notification mechanism or a way
to sort the issues?

Until your rename I was using arch:s390x to contact S390 maintainers
for build failure on s390x host [Build System, arch: s390x], bug in TCG
backend or bug in TCG frontend for target [accel: TCG, arch: s390x],
hoping at least one person notified would have further look.

> 
> And then there's the special case of TCI.

For reporters TCI != TCG, so the simplest is "accel: TCI",
but I prefer "accel:TCG:TCI".

