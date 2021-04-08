Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C841358DBE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:51:42 +0200 (CEST)
Received: from localhost ([::1]:55496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUagn-0008F1-EC
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lUafb-0007LT-3y
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:50:30 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:47024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lUafQ-0003aQ-Qp
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:50:21 -0400
Received: by mail-qk1-x72a.google.com with SMTP id z10so3501160qkz.13
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=V47yEbLv3xAp9IqJzznsq8IHtFICH+vtQBi6BGg9iiw=;
 b=VKLQfE/gRUQemIUWuatcYJxWCehlUSLwGNXql+hSRcXz0mN4qL3MZLhBHkl1h+g2x3
 pZJnGDbUC3BZ9vJ58qlfnBrgfDE0juE+UrgdoLm1jgFYbRuLyaitQvfEOgkHfoSuZN7y
 VuIBoc4dgzqD8g1HXBMczWZjOKoLPElS7nvNUlcXeU4GcAqZLep5MA8exbmEXEME35lT
 C59+S+uDeebPzwp1SjsfAsavXrMokiF6cgvrJvK5Lu1lk/IuTvKmLQRAD6qIdKZlZMQP
 cqy15ZpAW5FH8jmG4RYgChogJ8heaFwASOm7kkrZd5Kb133ZrndOJUZD7ZHkw7/dTCgx
 lvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=V47yEbLv3xAp9IqJzznsq8IHtFICH+vtQBi6BGg9iiw=;
 b=dLyh+lvxjHyL7dAd2ulLHLrvLTXk2JGIQHa2mNInehIZtHoPSuJr2KBRPHfiF+YExL
 gA2TWcfqTkM7xSW3LKoLcOCiq4Ar/dBpch6SAOQgL+ugT8XlCYmv4F7mqf942b3OlyHX
 0dBuQEtX8LqCBDQyTWHWCq3oacrrVT5ALXj/s9rDgyJj+qsLIN98al5uF83+XceCbXqV
 o4v9l31e6U4G2qE5X+PuP2O8aBfmc0m3xsoegprwaOKEHQBbQPfF0U/C+3oGEbNzIb9J
 yBXV4JzU0+zgV/gvaGqpeDKvuyt1Bi3SGM7qbwR0jKjmnhD2vChQ+f4fUFMuY0e4RV+f
 dwOQ==
X-Gm-Message-State: AOAM533Nxhu4A4yL/4CaiecE8/gtZJgU01JQTv0n69HCqOiQLM+JDnGk
 zMS2hhOePac3duk7ee7IZT4=
X-Google-Smtp-Source: ABdhPJwIQBUxb381Bc6PGp3fyMg/dJzByf9IP9kwrhW9cKDJ00qQ+3OZE+zje6Z1egPJ25uex4GxGA==
X-Received: by 2002:a37:8107:: with SMTP id c7mr10253096qkd.139.1617911415687; 
 Thu, 08 Apr 2021 12:50:15 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id d26sm319260qtw.72.2021.04.08.12.50.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:50:15 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Mac OS real USB device support issue
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CABLmASFLSZBapgZCNQuvDd4hvpVe4SSdY7ar+VH0w_ZjquoUKQ@mail.gmail.com>
Date: Thu, 8 Apr 2021 15:50:14 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <0BF93C96-9F20-41F4-88B5-3A96BAE54F2D@gmail.com>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <20210408110523.eh3i7djynv54cqi2@sirius.home.kraxel.org>
 <CABLmASFLSZBapgZCNQuvDd4hvpVe4SSdY7ar+VH0w_ZjquoUKQ@mail.gmail.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, Gerd Hoffmann <gerd@kraxel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 8, 2021, at 12:40 PM, Howard Spoelstra <hsp.cat7@gmail.com> =
wrote:
>=20
> On Thu, Apr 8, 2021 at 1:05 PM Gerd Hoffmann <gerd@kraxel.org> wrote:
>>=20
>>  Hi,
>>=20
>>>> Those might be a good place to start. IOKit provides the drivers =
and
>>>> also the io registry which is probably where you can get if a =
driver
>>>> is bound to a device and which one is it. How to dissociate the
>>>> driver from the device though I don't know.
>>=20
>>> =
https://developer.apple.com/library/archive/documentation/DeviceDrivers/Co=
nceptual/IOKitFundamentals/DeviceRemoval/DeviceRemoval.html
>>=20
>>> According to this article a driver has a stop() and detach() method
>>> that is called by the IOKit to remove a device. I'm thinking QEMU =
can
>>> be the one that calls these methods for a certain device.
>>=20
>> libusb should do that.  Interfaces exist already (see
>> libusb_detach_kernel_driver & friends) because we have the very same
>> problem on linux.
>>=20
>> take care,
>>  Gerd
>>=20
>=20
> As far as I understand the patches here
> https://github.com/libusb/libusb/issues/906 they are internal to
> libusb, so we would need to build a libusb for use with e.g., brew to
> build a macOS executable. Or wait for them to be finalised to get
> included in libusb and then included in brew and then ....
>=20
> Best,
> Howard

We could also consider our own git submodule incase the libusb people =
fail to fix their issue.=

