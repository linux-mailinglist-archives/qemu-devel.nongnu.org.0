Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9470180B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 17:31:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxrCL-00059B-UL; Sat, 13 May 2023 11:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pxrCJ-00058o-IT
 for qemu-devel@nongnu.org; Sat, 13 May 2023 11:30:15 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pxrCH-0006FA-Ne
 for qemu-devel@nongnu.org; Sat, 13 May 2023 11:30:15 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so98312765a12.0
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683991812; x=1686583812;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDGK7RXPYsDi+WiseNcEWVr/9+KY5KLd2I0swn3Fulo=;
 b=dxxgPNabB5ET3hl7PRkrmI7crIbCfdIjztGCUwutgIJD4Y6XNHNcFFbr7yuVQ2WiQx
 P1a8SCNSmJH0Cb7TJ3RQuflHP52i8IGHz3G54dRq5CFpiKKOwQ1dy91XGb1m4W3GpjdO
 TGjxDS3zP1Al7wAQY4s/v/NBnzNOKB/98Bh9gJ5piaUrtzwOOZ/W7VXGeQXyZ91+My+o
 RcMwXU/dI83HNAeL8CflqzjEIW4aMIAxw48GMhR/DZkbzNv56bdn255kCv9kDNwElhDw
 vDbUHyebnenyv2i+bDoGrcpxHaDTmhOZ4NtSzg++NVPkKE8TdTUc+xnSLuydYX5CZmJT
 /Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683991812; x=1686583812;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jDGK7RXPYsDi+WiseNcEWVr/9+KY5KLd2I0swn3Fulo=;
 b=bxbtE2hrjCgFWptGybh0yL7IHjXvvEQainv8QHVqeMr5iTvltoPln7l3YvuJq+88yP
 XyqJ+3BW4WyeQ8wLUaoabBJ5onIcdns4MxGq0JhT7SbHEij5TWi/mF3/zlroCNON3xny
 Rct2yInt+Q00Qkc6QFrFFYHRGbQ77FyBExpnWCGmnzbfemUdqKcUfKYn6Y2bfuB/ssfj
 JYDN38mAHfwzPOoiO40NKfVi2/vQOtivGRbOF+cV7Z0nqodsLwVrVkB0GKMAMS5No4HR
 y+sKwvv5iJ4jMIgum9StSISNzzMgEm+K/KGXDjIdFgcdYezDwYqYDwpOIOQglXBadW0a
 i9Dw==
X-Gm-Message-State: AC+VfDz77Y1kAkNz6/3TiCUHs7ez1DGJKu0EweRxHJJBm5JnmlmXUYqB
 02azTsfSe6GCoHoMTRMF/9M=
X-Google-Smtp-Source: ACHHUZ65g4oyfhFlY0DxmmxNoGMAQPyFP3XWSeB9ZsKLLuRLqMpHuYLQZzZa6/E2uruhT+Ocav51TQ==
X-Received: by 2002:a17:907:97c4:b0:966:4669:7e8d with SMTP id
 js4-20020a17090797c400b0096646697e8dmr21276982ejc.16.1683991811922; 
 Sat, 13 May 2023 08:30:11 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-174-037.77.13.pool.telefonica.de.
 [77.13.174.37]) by smtp.gmail.com with ESMTPSA id
 26-20020a170906319a00b00966056bd4f4sm6837204ejy.28.2023.05.13.08.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 08:30:11 -0700 (PDT)
Date: Sat, 13 May 2023 15:30:05 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: quintela@redhat.com, Juan Quintela <quintela@redhat.com>
CC: afaerber@suse.de, ale@rev.ng, anjo@rev.ng, bazulay@redhat.com,
 bbauman@redhat.com, chao.p.peng@linux.intel.com, cjia@nvidia.com,
 cw@f00f.org, david.edmondson@oracle.com, dustin.kirkland@canonical.com,
 eblake@redhat.com, edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com,
 eric.auger@redhat.com, f4bug@amsat.org,
 Felipe Franciosi <felipe.franciosi@nutanix.com>,
 "iggy@theiggy.com" <iggy@kws1.com>, Warner Losh <wlosh@bsdimp.com>,
 jan.kiszka@web.de, jgg@nvidia.com, jidong.xiao@gmail.com,
 jjherne@linux.vnet.ibm.com, joao.m.martins@oracle.com,
 konrad.wilk@oracle.com, kvm@vger.kernel.org, mburton@qti.qualcomm.com,
 mdean@redhat.com, mimu@linux.vnet.ibm.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, richard.henderson@linaro.org,
 shameerali.kolothum.thodi@huawei.com, stefanha@gmail.com,
 wei.w.wang@intel.com, z.huo@139.com, zwu.kernel@gmail.com
Subject: Re: QEMU developers fortnightly call for agenda for 2023-05-16
In-Reply-To: <87mt293geg.fsf@secure.mitica>
References: <calendar-f9e06ce0-8972-4775-9a3d-7269ec566398@google.com>
 <871qjm3su8.fsf@secure.mitica>
 <452B32A5-8C9E-4A61-B14B-C8AB47D0A3ED@gmail.com>
 <87mt293geg.fsf@secure.mitica>
Message-ID: <4DE2BB0F-8C4D-4358-99C8-C65E9E821EB6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 12=2E Mai 2023 12:04:07 UTC schrieb Juan Quintela <quintela@redhat=2Eco=
m>:
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>> Am 12=2E Mai 2023 07:35:27 UTC schrieb Juan Quintela <quintela@redhat=
=2Ecom>:
>>>juan=2Equintela@gmail=2Ecom wrote:
>>>> Hi If you are interested in any topic, please let me know=2E Later, J=
uan=2E
>>>
>>>Hi folks
>>>
>>>So far what we have in the agenda is:
>>>
>>>questions from Mark:
>>>- Update on single binary?
>>>- What=E2=80=99s the status on the =E2=80=9Cicount=E2=80=9D plugin ?
>>>- Also I could do with some help on a specific issue on KVM/HVF memory =
handling
>>>
>>>From me:
>>>- Small update on what is going on with all the migration changes
>>>
>>>Later, Juan=2E
>>>
>>>
>>>> QEMU developers fortnightly conference call
>>>> Tuesday 2023-05-16 =E2=8B=85 15:00 =E2=80=93 16:00
>>>> Central European Time - Madrid
>>>>
>>>> Location
>>>> https://meet=2Ejit=2Esi/kvmcallmeeting=09
>>
>> Hi Juan,
>>
>> Would it be possible to offer a public calendar entry -- perhaps in
>> =2Eics format -- with above information? Which can be conveniently
>> subscribed to via a smartphone app? Which gets updated regularly under
>> the same link? Which doesn't (needlessly, anyway) require
>> authentcation?
>
>This is enough?
>
>https://calendar=2Egoogle=2Ecom/calendar/event?action=3DTEMPLATE&tmeid=3D=
NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMzA1MTZUMTMwMDAwWiBlZ2VkN2NraTA1bG1=
1MXRuZ3ZrbDN0aGlkc0Bn&tmsrc=3Deged7cki05lmu1tngvkl3thids%40group=2Ecalendar=
=2Egoogle=2Ecom&scp=3DALL
>
>If that is not enough, if you know the knob to convince google calendar
>to do it I am all ears=2E

The links still asks annoying questions=2E I'll check for that knob=2E

Best regards,
Bernhard

>
>Later, Juan=2E
>

