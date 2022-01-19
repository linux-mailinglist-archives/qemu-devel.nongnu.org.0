Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2714938C5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:37 +0100 (CET)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8SC-0006NU-OH
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:44:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nA8Lo-00016u-LF
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:38:01 -0500
Received: from [2a00:1450:4864:20::52a] (port=38631
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nA8Lm-0006kY-LZ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:38:00 -0500
Received: by mail-ed1-x52a.google.com with SMTP id j23so3974090edp.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 02:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=f9fi3PJZMNu/SYw9yQmqhARJTwTdR7XOLMqBlez6drg=;
 b=VmSe5G7pxlQicoGkveXvBZo2k6a9EqdgL0u3oNoQRNFtBUWkKtrITsMtMV3lck3J0J
 6sPZl7kv6Ibix3yDIeYF+ffs6h76uarZSD7a+xf/pYs/CraBjldPL2lsM49BO9xKIfIM
 IH1unyGc9b5FC9ulrGMdiDosmSPXuGHS+9AidspdOws0Dj6RpRlVtdjfZAbugHiXwTAb
 Y0nHugp2zb8NfDMAkRFrgoUZI9q5dyX8JnhqoaKIqFwSkbYaYrVHKiaMMyIriAEY13Aq
 X4isoBlNbUocoac+N/UUklEmn+I4BNKglLdp6uVim3Xe27QSaNLEijMrvGNZWO42268+
 l/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=f9fi3PJZMNu/SYw9yQmqhARJTwTdR7XOLMqBlez6drg=;
 b=c+dpdEArsnUbbqCvv/0FgCEDhgqzRA8eLF+xD4QnwnIHA0rwI4AkRchzVOkNuGn1RG
 3A2iNETWar8wxypiWjrA6hlV+Ixa90/QtSZ3RxkRpxS87HEEjh4+xfIpy7D3Str1fscK
 kp8lCRI49pdVzQAad+o+BFyVziSB3kpljIOScKWM7yohD4cHLjkE3YBPhE+TJu2AUtAJ
 SEIO79Xl6xTBCRweBf8SiO5hjXNqAvEOFc/6tLMF98y8P+bBwqlNZyZEUeKQKcGS6dpM
 oGFChxEOqxZ/6ow7kHZrvN6wnVz/U3ZiM8scTlo/LrA4LIv/H51wRURpDVz/Houvar3c
 O91A==
X-Gm-Message-State: AOAM530HvuoLQygeT/slfgf+RXDoK0XoDbpRAMJVVNyE73bR8icbvToq
 nfnWz9EQwWrmnyPANlsu3K2IeA==
X-Google-Smtp-Source: ABdhPJwFk1frCBt+Np1FX+g026pPD6w96MupJddzEk5kfCV+RJmNMvyAzvvYv63JFLE7q1rju86oEw==
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr29303945edu.237.1642588677132; 
 Wed, 19 Jan 2022 02:37:57 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id w3sm6220000eji.134.2022.01.19.02.37.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:37:56 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <bc26f3d1-12b2-7b50-4c46-5c4f934a6343@amsat.org>
Date: Wed, 19 Jan 2022 12:37:55 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5513A108-F7ED-4628-AF8F-F41D8FD11BAA@livius.net>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
 <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
 <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
 <CAFEAcA9sNksi2=xiFUp_r0_NeCuUKXYU6sd1LDvX=j0+Mh3gYQ@mail.gmail.com>
 <3DE1FD39-B0F7-45D2-BC44-66D9B0533057@livius.net>
 <CAFEAcA8aMc40ea=F1P7vHHeNF=rqE+B=sz+6QdzrOWGwZU7W6A@mail.gmail.com>
 <E7A03D00-4F6F-4DC8-A8E5-84D0E13A79E3@livius.net>
 <bc26f3d1-12b2-7b50-4c46-5c4f934a6343@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 17 Jan 2022, at 18:19, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> The consensus was UI should not be addressed within QEMU itself, but
> via an external helper, eventually using D-Bus. D-Bus support has been
> recently merged:
> https://www.qemu.org/docs/master/interop/dbus.html

Thank you for the info.

I'll review the details when I'll start work on this, and hopefully find =
a solution that will be acceptable for upstream.

However, please note that the solution used in qemu-arm-gnuarmeclipse =
was highly appreciated, and the use case was very intuitive, simply =
starting the emulator brought the graphical window, which looked like =
this:

- https://eclipse-embed-cdt.github.io

So, if the UI should not be addressed within QEMU itself, the details of =
starting the external helper should be transparent for the users.

>> If you think useful, I can contribute the patches back to upstream.
>=20
> All contributions are welcomed for review. Even if a contribution is
> not merged right away, you can see the mailing list as an archive for
> previous attemps, in case a contributor gets stuck or have to switch
> to another project, someone else can restart / keep working on earlier
> series.

Ok, for now I avoided the problem by reverting to Cocoa, but I might =
have to address it in the future.

If someone else needs SDL support on macOS, we can work together to =
update the patches I used in qemu-arm-gnuarmeclipse to the new upstream =
code.

Perhaps we should log a ticket to keep track of the issue.


Regards,

Liviu






