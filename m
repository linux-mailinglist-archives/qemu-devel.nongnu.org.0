Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F766025E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 15:42:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDntk-00026l-2U; Fri, 06 Jan 2023 09:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <benjaminellis04@gmail.com>)
 id 1pDk9F-0001B0-1u
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:40:32 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <benjaminellis04@gmail.com>)
 id 1pDk9D-0000QE-GV
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:40:28 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 m7-20020a9d73c7000000b00683e2f36c18so758110otk.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 02:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DT8RSzKBPOJpKcqCiqunw0HMfS2EGvSDz4VV2ifXKHQ=;
 b=FOkjX5WXwsBC56vpqf0b3sotKieN6VQ6zah/4gDIMQHhhmq5pRZ3fWadCAMvWVIzlE
 kpCHvo6n8JhH4EhlVwuo9JO+24s4QEQWMiHQ01G1IgThBMKM2TClo4VvZI/o/oQ4JzXk
 XMg5j58/Ai+d+4NWxlhm2VWdnij5U8lH097+gAvm5E4zVbjhZ2vZJjhBYgVI1PagHkxs
 E4X8hUGlxTskskm+EZ1niZGnKqEmFJaNJ9BBK06xWWul8Vi9OeBwP0wf0+I3Dv1Z1Er1
 ECff974OpdTcCqvpY5m3+On873OtavJy/ZfgVhsHCle8pJpvtehI1WTEUPYA0n9LAD7u
 9ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DT8RSzKBPOJpKcqCiqunw0HMfS2EGvSDz4VV2ifXKHQ=;
 b=Swc0HwVQXJp74T+L5LogYFNx6d/PiemZGjZxfwtbn/67GbhP+0pbQDnc09U+oEk33p
 II987fEDkOPsUzwDBKgT7cBCV7c8UYrwZk0ZCQ39ppWyHuhF1dtBbDsRJH2NS6P+W9hE
 khUSv/ezE78eNohyGrsMutmOUPYhUeeD6VGcGwggDg5YMad6RMhHrP1+m5s2xbldDrPl
 AUdXc369IHP2dqrrcKsWIGm/+xJwcm+UvpL0ZsGjg3IFoNzLrMQuW8afP3UTnCVG/hBO
 fSESMUUneQ2J5qOU+wpV73eLcrxFofbugruJ2uQ02vXqvkfzmi5nU4zxoxG7nf8yK1OC
 ALsw==
X-Gm-Message-State: AFqh2kp6Ng9AQkeKxt2Ivli1zaKE2iQaM/8EqkHvbgQhb4TwqytnBB85
 VcuUx5pg44i0HMFJUUtnaYscl3y+ZFcltg+oas9D7nsQf9qTTg==
X-Google-Smtp-Source: AMrXdXujSo9wwHflQlYdqvjCTd6V/B7t3UP51Tm1TIpxT+Ko6MRLcYEIPcxG0lnATN82L2JTBIuHYO+RfhhDkTQhEsM=
X-Received: by 2002:a9d:7dcf:0:b0:676:20e6:ce15 with SMTP id
 k15-20020a9d7dcf000000b0067620e6ce15mr3678766otn.317.1673001626181; Fri, 06
 Jan 2023 02:40:26 -0800 (PST)
MIME-Version: 1.0
From: Benjamin Ellis <benjaminellis04@gmail.com>
Date: Fri, 6 Jan 2023 10:40:15 +0000
Message-ID: <CALSF47w+0AqbO39mMpkPPfRwd8jLGQD68di7amNzeH7CpnLCmw@mail.gmail.com>
Subject: Support -O
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a325bc05f1960b56"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=benjaminellis04@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 Jan 2023 09:40:42 -0500
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

--000000000000a325bc05f1960b56
Content-Type: text/plain; charset="UTF-8"

Hi QEMU,

I am trying to use the -O function to convert a file format to vmdk, but
get the below response. Please could you help?

Bens-iMac:~ ben$ qemu-img -O output_fmt vmdk
/Users/ben/Documents/Windows11_InsiderPreview_Client_ARM64_en-us_22598.VHDX
~/Desktop/Install/Windows11ARM.vmdk

qemu-img: unrecognized option '-O'


Many thanks,

Ben

--000000000000a325bc05f1960b56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi QEMU,=C2=A0<div><br></div><div>I am trying to use the -=
O function to convert a file format to vmdk, but get the below response. Pl=
ease could you help?</div><div><br></div><div><p style=3D"margin:0px;font-s=
tretch:normal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb=
(0,0,0)"><span style=3D"font-variant-ligatures:no-common-ligatures">Bens-iM=
ac:~ ben$ qemu-img -O output_fmt vmdk /Users/ben/Documents/Windows11_Inside=
rPreview_Client_ARM64_en-us_22598.VHDX ~/Desktop/Install/Windows11ARM.vmdk<=
/span></p><p style=3D"margin:0px;font-stretch:normal;font-size:11px;line-he=
ight:normal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"font-variant=
-ligatures:no-common-ligatures">qemu-img: unrecognized option &#39;-O&#39;<=
/span></p><p style=3D"margin:0px;font-stretch:normal;font-size:11px;line-he=
ight:normal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"font-variant=
-ligatures:no-common-ligatures"><br></span></p><p style=3D"margin:0px;font-=
stretch:normal;line-height:normal">Many thanks,=C2=A0</p><p style=3D"margin=
:0px;font-stretch:normal;line-height:normal">Ben</p></div></div>

--000000000000a325bc05f1960b56--

