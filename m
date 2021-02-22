Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5284F321AD4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:09:27 +0100 (CET)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECpy-0005rr-CF
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1lECjc-00081n-O5
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:02:55 -0500
Received: from mout.gmx.net ([212.227.17.20]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1lECjW-0004ug-Eg
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614006145;
 bh=E7G8vYdSgFhiAcWn4whZpbzoBhXqlAFslgqc830M2NA=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=QkTuVqc62Y+64ltN7RI2I2uXZJBe/euYLnc7GhoDuJVCrRGEIjJkA7zRbic7Gawk9
 cVOFcEgscLhiJllG7l8TlcMTEa/a1B/E21TOsQ4a6yDIaWfxsd0b0P2BC1lo5OJ2WJ
 gcONI/qNnO7AZCR5nWtdd2whuBc7fSeavIZGhivk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.144]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvLB-1lNn081mZp-00RqpA; Mon, 22
 Feb 2021 16:02:25 +0100
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: Michael Tokarev <mjt@tls.msk.ru>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
 <09fefe8c-c3bb-1303-9e85-d207c6ec4ffc@msgid.tls.msk.ru>
 <d0076988-a8f9-cd4c-1d19-bcb0b0a28dfb@physik.fu-berlin.de>
 <ba3a2bae-d2a4-ca3d-cf3f-c2effc9d6ca9@msgid.tls.msk.ru>
 <1f1c6fa9-a9cc-b169-1c9a-57008752efb4@physik.fu-berlin.de>
 <644a53ea-852e-b60c-973d-10e37096d99e@msgid.tls.msk.ru>
From: Helge Deller <deller@gmx.de>
Message-ID: <e14413e5-af09-e101-6320-34e90811f414@gmx.de>
Date: Mon, 22 Feb 2021 16:02:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <644a53ea-852e-b60c-973d-10e37096d99e@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5BtLYoHwLtMmugljudReXfGtYn5eqLDUjuj5j2pIZ+2FLZ698kA
 /lawNhuQcP/YFmjr+P+Ue25nuob3W8n6veAzYb/x2bxXojwRkUYQ3oCZh56AwPnbL2tgj7B
 ew+hupdjjkNiqtxqVkA2/yGeOQQRh1H6xq7jwxMs5chb5uHUl5PiCYckSczNWZkJJnShjWG
 ikvY9dqygdn6egHo7YV8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gi4LcaoUgvw=:NAx0ND6nsTtzCcHI6HOEr8
 UzSNvueAKjoN6zmfx298mDqrp8IpNh3GEr2ZMb4vCDrpTDoiQlZF93m3idS9aeu1UtGOL8uOm
 ulB8lX+hdWyal8on9sQpm7GLHv9uZoB9z1VX2K1GjVRG8WyNiIEEApHAekrYATn792H5baTAj
 EQy4Nx1TKhRaAP8E//RAQpeYTJGrPVE5JsDpbo0UXKajMaRsZlVOFpUtEtUjfIgr8qBGzwWhq
 83bKJfiELpVeYzRUAkQXrqLxOEZ1tBiK44TXJjeXfFDEKuDJYg71RmSNy8zRufdzfH4TNzHJm
 BLj3Gq6lv7RpDkuH4izSFUDyj8dytgLGUftT5YYJtdaq5MJYCwJNoCJE0GylxtRjUA39b8JEN
 bsynAXHxfHrQVC6D2nswcun21s2B/JNcWOULVmMjzPZ0kONgKPqYTw3gQeheNfNUAeeTYeEvL
 qVTf+v9PFtTEFEmBWUhDXoMyUw36vrf9gA5Hwwr4sk3w1Jw8SxSqpHDjevn2KuBHbCx+onphB
 /rmaNCUE/8qctOvIoGJBE25LjHlr+erVWRQNANRqrwBUC5oak63XXMsQTuyhcAI4S0rwSSiXT
 RbWmEH39wVViaNOcf1Yn7b1oujC/QpKIXrBmCVDvmQb9YPaTsOtwdlEc2vVTqYd0jZW/wgBCg
 kHhj+FSrUs/lpe3a9ImS0oMgHMrN9xcNdHOvdQVE/0LuqBzMkNYqvlJdXxCWGYmYyBOWDiO40
 8wYBxlQpw0wq9JqLeAeKyr8TuBUpOTwj8zWrMknEZAhSKtG4SmARvdDJJReK6VaJ0FQS2T0vQ
 wisg3ZbQjQKr9OAV4rKvyFYEaYuxSIQj3uGZyEdamKZYu9DoryiDvHHKPc4P2JdEZIrosvp8l
 tbMAbgFzfjVg+S2VB6bA==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 2/22/21 3:58 PM, Michael Tokarev wrote:
> 22.02.2021 17:54, John Paul Adrian Glaubitz wrote:
>
>> OK, gotcha. Is it supposed to work with systemd-binfmt? It looks like i=
t depends
>> on the old binfmt-support package.
>
> the qemu 4-line patch does not depend on any particular system, it relie=
s on a
> special name of its own argv[0] when registering the binfmt entry.=C2=A0=
 In order to
> utilize it, we create a special-named symlink to qemu-foo and register t=
hat one
> with the binfmt-misc subsystem, no matter if it is systemd or binfmt-sup=
port or
> whatever else.

... which is pretty hackish (although it apparently works; I haven't teste=
d myself).

The big question remains:
Is this "hack" just a temporary workaround which should be kept, or
is the support via the kernel-patch from Laurent the long-term and better =
solution?

Helge

