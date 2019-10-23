Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E6E17E8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 12:29:03 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNDt0-00028O-60
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 06:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNDjn-0004yY-74
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNDjk-0000xg-GM
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:19:30 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39571)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNDji-0000xE-IE
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:19:26 -0400
Received: by mail-wr1-x441.google.com with SMTP id a11so5346733wra.6
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=+9BvmH+auf+Mrzy4Y1NGV6GIRCAfWK3RmjHBCwFVAQw=;
 b=iRmEynj6DXZogf5FcP8a0MAcAyH/3JtOT67FlvFN6fIO35J66ND36KvHeLS4s/Zkpp
 5gdaelzcsfESqO7SSVm/iMI8F/rTJtGAENeD2wD64mjQLMgRyF2Dlo4r+pnPI0hVbKCy
 /2PwB/XmIqWE24M0/dlumw/yRcW5FxurfESTcLckQ0MNIhkj/P26W+k/QaR7HaDA855Q
 ccOsrjeK15DPCtAM4VvRRUoec+ZpADXAS0Apf1IyAod3G+v8xypphBhviZGzyeWIILGW
 k85Yl6IxvBRi6nqTZeSCDgU4ovwY2izhQgzZtio30mH28OFbe4d6MRmNaUUSLv87jd/8
 iwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=+9BvmH+auf+Mrzy4Y1NGV6GIRCAfWK3RmjHBCwFVAQw=;
 b=aIoaO5S3M3ZujJDE72hJ1ru3n7QIzMDnwD0qIhk1PdPymn3IyX/9xeibVOpzNaCOmP
 9A7bmuPdedkZXxIEJFQNNkdOdtAV5ONQuwMC/9MFtq5zTZC3wv9id6qH+PD/jM7CLjZU
 4ie2TkratggjKZwGVa7ZRcQ7TRqelDz3OUcnTQdTYehIbc1ujU21F7X5+QhHnsagauUh
 e1irJH10SEz60ORKKRoQpBUFGsxltcal7K8SdUhHInUHwwKGFI6uASQLaW7ZaRE6SaOG
 zWyPFImFwgAQuAzz2f9UAIGC01P6McHQ9u8Xc4dO7mhn1XC7huDW6zN8SuVUMvl6JvGv
 kctg==
X-Gm-Message-State: APjAAAXpbVVHlxmemeFW1MruccBKjkL4TeW9QnYErgTCTl2d5FwpVV/G
 +xnqc63kXiCIe0TUg3IZ+6OOuKZowTY=
X-Google-Smtp-Source: APXvYqyo70vf/PuInvo6KNaYJNYHFsf/e155A6qRw32ZHFM3YXYhjC47UTSpPC3++y2BYnxmLdvB3g==
X-Received: by 2002:adf:9799:: with SMTP id s25mr7735442wrb.390.1571825964089; 
 Wed, 23 Oct 2019 03:19:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm29073287wrg.63.2019.10.23.03.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 03:19:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF0FF1FF87;
 Wed, 23 Oct 2019 11:19:22 +0100 (BST)
References: <20191022191704.6134-1-alex.bennee@linaro.org>
 <381938133.8120078.1571815205455.JavaMail.zimbra@redhat.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for 4.2 v1 00/19] testing/next before softfreeze
In-reply-to: <381938133.8120078.1571815205455.JavaMail.zimbra@redhat.com>
Date: Wed, 23 Oct 2019 11:19:22 +0100
Message-ID: <87tv7zvk5x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> ----- Original Message -----
>> From: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
>> Sent: Tuesday, October 22, 2019 9:16:45 PM
>>
>> Hi,
>>
>> This is the current status of testing/next. I dropped the Travis arm64
>> build due to stability concerns. As far as I can tell Thomas' latest
>> iotest updates are working fine. If there are any other patches worth
>> considering before the softfreeze now is the time to shout.
>
> Feel free to include:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2019-10/msg03912.html
> ("gitlab-ci.yml: Use libvdeplug-dev to compile-test the VDE network
> backend")

done.

--
Alex Benn=C3=A9e

