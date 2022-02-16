Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0834B8C42
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:18:53 +0100 (CET)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKM4y-0005c3-In
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:18:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKM3m-0004mI-Qw
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:17:38 -0500
Received: from [2607:f8b0:4864:20::432] (port=46687
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKM3l-0005PE-7I
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:17:38 -0500
Received: by mail-pf1-x432.google.com with SMTP id i21so2337705pfd.13
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 07:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Q1Zsq2uisU0kJFxeV+colZSEAD8yJLqzq+oYUzwQos=;
 b=W983VES4cf5xxaFK3u78vOfRTNUcAp96PoembnSHDeeKdzCZS1NXSOKuKKbj3QOUdt
 9nyDpwc0BpzINuDDZTys+PZMcWHePaqFLXHaAgiPSh3VBxqZ8nDWWgwragqzaml68rN9
 3M7M5/Yt9uvjU3mqzFvjDQtxszjlebOPF76OtYhk3ubstD34KsE2AIuQYsIxlClpkjND
 YBjiz/VbklCWfceAhkAHUH5TfHmJAy6Asyh654hZlnTzO955+x2DWRzCD6xMywO/xJUu
 xb+6p7Zi6cy0esEFv4trN47d8eFWv/dcDlpKjBmvpY8a2BrNJmup78D4bFXJ9e4rtgio
 Ra0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Q1Zsq2uisU0kJFxeV+colZSEAD8yJLqzq+oYUzwQos=;
 b=qNl25lHBr1d1nZxOZUXn2Z1nvasPt5yNSjYgjYqf+aWsZccXEjHAyprpO2527phjQ4
 w4SdUVur1KRgm3VZOCNdywWdojMGSfHXZuLJLE1NDBKWIRj55vXJaA9Z8aAX/bozC3Xj
 KIFNGLx29ZzFFHo5LvefFu6S19MAVcSFVTWDQ2K+5EvRvRLdcmslUhGEV6fsuq/Pz73d
 8C5qgof/SiQzuQJKgpde5Kj8FcZquc0wgpu9dr7Q27MyIyWPayPeFnM4XBORywgFEmaw
 lZs9jj2zY77NRCWDK9DrvFdUT8Q/EtB3dmI6fkzXx88QthLHmkWk6LEnSSItlMADwfIb
 wJPA==
X-Gm-Message-State: AOAM530rOzDNGjyKg8Kyc+SOfDGRnEUxY9BCOx9WpG0qK+FwrWoOU97d
 MN0ZuxtNHyGumeXX8pKajxM=
X-Google-Smtp-Source: ABdhPJzppTaM8Th4tM3V4dmjxY8ftOHACqh75BugwWu71c7rEHbtMOwTmzQfjw1A8JpMTfxV+LQIeA==
X-Received: by 2002:a63:fa0c:0:b0:373:13fb:9956 with SMTP id
 y12-20020a63fa0c000000b0037313fb9956mr2673475pgh.391.1645024655718; 
 Wed, 16 Feb 2022 07:17:35 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id 142sm37186659pfy.11.2022.02.16.07.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 07:17:34 -0800 (PST)
Message-ID: <cdc339d9-0a6b-5535-14c5-fee964649f4d@amsat.org>
Date: Wed, 16 Feb 2022 16:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: Undelivered Mail Returned to Sender
Content-Language: en-US
To: "Joseph Fitzgerald (KM1P)" <jfitzgerald@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "postmaster@amsat.org" <postmaster@amsat.org>
Cc: qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20220216022900.8DE3E1770A1@mail-01.amsat.org>
 <CAMVc7JUy5NeEN0q=4zfZvn_rppgqn9wicV1z=TsLuHKS3RY3Sw@mail.gmail.com>
 <PH0PR16MB476031694D02A6550B15D294B6359@PH0PR16MB4760.namprd16.prod.outlook.com>
In-Reply-To: <PH0PR16MB476031694D02A6550B15D294B6359@PH0PR16MB4760.namprd16.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 16/2/22 14:54, Joseph Fitzgerald (KM1P) wrote:
> Thank you for this trouble report.
> 
> We recommend that Philippe subscribe to the qemu mailing list via a 
> "real" mailing address rather than his f4bug@amsat.org mail 
> alias/forwarding address.

Sigh, OK :(

> There is some combination of the Free Software Foundation's mail server 
> configuration and our remailer that causes and Google to reject mail 
> from the qemu list - other traffic to Google flowing fine.  We have been 
> in communication with FSF to try to resolve the issue without success to 
> date.

Thank you Joe & 73

> 
> -Joe Fitzgerald
> AMSAT IT
> 
> 
> 
> ------------------------------------------------------------------------
> *From:* Akihiko Odaki <akihiko.odaki@gmail.com>
> *Sent:* Tuesday, February 15, 2022 10:20 PM
> *To:* postmaster@amsat.org <postmaster@amsat.org>
> *Cc:* Philippe Mathieu-Daudé <f4bug@amsat.org>; qemu Developers 
> <qemu-devel@nongnu.org>; Roman Bolshakov <r.bolshakov@yadro.com>; 
> Christian Schoenebeck <qemu_oss@crudebyte.com>
> *Subject:* Fwd: Undelivered Mail Returned to Sender
> Hi postmaster@amsat.org,
> 
> Apparently your system is rejected by Gmail. Could you fix the problem?
> 
> Thanks,
> Akihiko Odaki
> 
> ---------- Forwarded message ---------
> From: Mail Delivery System <MAILER-DAEMON@mail-01.amsat.org>
> Date: Wed, Feb 16, 2022 at 11:29 AM
> Subject: Undelivered Mail Returned to Sender
> To: <akihiko.odaki@gmail.com>
> 
> 
> This is the mail system at host mail-01.amsat.org.
> 
> I'm sorry to have to inform you that your message could not
> be delivered to one or more recipients. It's attached below.
> 
> For further assistance, please send mail to postmaster.
> 
> If you do so, please include this problem report. You can
> delete your own text from the attached returned message.
> 
>                     The mail system
> 
> <philippe.mathieu.daude@gmail.com> (expanded from <f4bug@amsat.org>): host
>      gmail-smtp-in.l.google.com[64.233.177.26] said: 550-5.7.1 
> [172.105.152.211
>      12] Our system has detected that this message is 550-5.7.1 likely
>      unsolicited mail. To reduce the amount of spam sent to Gmail, 550-5.7.1
>      this message has been blocked. Please visit 550-5.7.1
> https://support.google.com/mail/?p=UnsolicitedMessageError 
> <https://support.google.com/mail/?p=UnsolicitedMessageError> 550 5.7.1  for
>      more information. m141si25626293ybm.519 - gsmtp (in reply to end of 
> DATA
>      command)

