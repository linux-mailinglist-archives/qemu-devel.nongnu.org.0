Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F587442E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 06:02:07 +0200 (CEST)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqUxC-0002nn-HS
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 00:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47149)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hqUwz-0002PZ-BB
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 00:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hqUwy-0007xL-F6
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 00:01:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hqUwy-0007xB-A2
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 00:01:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A81FB882F2;
 Thu, 25 Jul 2019 04:01:50 +0000 (UTC)
Received: from [10.72.12.18] (ovpn-12-18.pek2.redhat.com [10.72.12.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79F7860BFC;
 Thu, 25 Jul 2019 04:01:48 +0000 (UTC)
To: qemu-devel@nongnu.org, no-reply@patchew.org, ppandit@redhat.com
References: <156390388086.12764.7714147258543962468@c4a48874b076>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <536a2066-2a06-2a51-baaa-6e146c6dbeec@redhat.com>
Date: Thu, 25 Jul 2019 12:01:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156390388086.12764.7714147258543962468@c4a48874b076>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 25 Jul 2019 04:01:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 0/3] restrict bridge interface name to
 IFNAMSIZ
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
Cc: liq3ea@gmail.com, berrange@redhat.com, pjp@fedoraproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/7/24 =E4=B8=8A=E5=8D=881:44, no-reply@patchew.org wrote:
> Patchew URL:https://patchew.org/QEMU/20190723104754.29324-1-ppandit@red=
hat.com/
>
>
>
> Hi,
>
> This series failed the asan build test. Please find the testing command=
s and
> their output below. If you have Docker installed, you can probably repr=
oduce it
> locally.

Prasad, this looks unrelated to the series? Please double check.

Thanks


