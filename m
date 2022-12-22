Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC2C653BBF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 06:28:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8E74-00023b-U9; Thu, 22 Dec 2022 00:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8E72-00023Q-VW
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 00:27:24 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8E71-0002h7-2b
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 00:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671686832; bh=7AwTwwGG2p+gQqwPZwXZljFOTzpe9jg0R+ID+K6NYb0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=r7coyuMAiKjYFZDaVilC1bbfIg551NQyEjWPqBu4hYZsg+cvWyvcJel0LHTFQqPsT
 DTs2ZYN/yKPOH2edq1mJipZEch9JbAJlCIPkGhd5UJtf5yyJTOnLrNvM9xX2r6S8v7
 Po++4H7FebKzETkut5GIod1HPjnmOShZlYPnCMFSaWX07bxdoizfvhAqwDwDu1RQTt
 /Vm7znWPQECF9zPVQDPlbm6kl8PaLZsRjbUb8/jy4zPSt13+pnnkGn0jVqHrMQ73d4
 iKMY+B/qaBzW1w2Yl0NOjWcFsEXuD0HFOdb9r9cwNsGa1VhFbwVnN+6ylWcMUxcwvd
 OrGuAk1h0zZJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.146.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIwz4-1pROck0sA6-00KOK0; Thu, 22
 Dec 2022 06:27:12 +0100
Message-ID: <275eaf3e-335b-406b-b7d6-d23f969a1a16@gmx.de>
Date: Thu, 22 Dec 2022 06:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
References: <Y5zB+5t5K0AEj6Rn@p100>
 <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
 <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
 <CAFEAcA8q8aqWvd7dwuH79yzq6Kyg-EVo9YzsWJ_mav4bLLH7eQ@mail.gmail.com>
 <02766634-1ec0-436d-d641-c0c61997138e@linaro.org>
 <CAFEAcA-_ncQwXjkV7=ZMwQOjOonQhqJhOfQ8B7xAcVM=phhzyg@mail.gmail.com>
 <233346fa-a06f-f0a8-e842-bf386316ccbc@gmx.de>
 <9a3fdf8b-74db-7e0b-5bf1-43b0390e5be0@msgid.tls.msk.ru>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <9a3fdf8b-74db-7e0b-5bf1-43b0390e5be0@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NcRjWV1R+J6ZHZAE+zNtM0SPshYIBqxVvc7w/hBdqKmjDlw4jr0
 WSHKC6jSOt7gv6xbuAExQFNwcqIxxmFzh/lwO0aQWWpx8MSXfVdMIQPy5OtA7nfKfZdlhvW
 Hv4MBaEj2Eek06tj5T7p8v2PMr6Cof71liPyZOye1GmI//exIwS2xvh4ax1fn/RB3f1/999
 6RRsCspuUfsJ7h8Ab0ALQ==
UI-OutboundReport: notjunk:1;M01:P0:C4l/PqnajOY=;lUvxbQzi1fSkrSnvcLfX81LxqmA
 V9r+MpumZinpHQDcVSl1vByDWM8w3M/Rp60UBml+nIOAu9udEmTv1IKJX35OvZhHLdqckGMGK
 U5SKffnDjEw9RWjIaGOoNTQhXX1wGcsY8OiF3Q9pg9UsPKmVY4IgcOfy6VU0BuKJbXdLWiPxO
 gr61qqAmgTSr9xD7ewF5fvKFidKKFPgUxDNy/AA0WRIwjwQh5687Z9vVf+NTsofH4oVKfn1EO
 bzVToZh7tS1YrCbMS0dUCt11R633E98YzU+ZjcsMYdFqxNl1peP/CeTqg+ff8/ks6SHzQMTFF
 ayQ/I3NAKfpeqKqeGQWOqtmddK1NYlCR9GDo6TOP3m4vt8jvh/H5KNDBJRP+NKHPooIEQLYLP
 RIXHrZM7t0937kIrsnPfy2BIOVBFhcTaVonf5pqvPh1ouHz1/gNl6dLAHDpFSSyimwt0OtUzV
 4xHLN8RvV4tOy5vXVkEqKiLgBfwY1eetaP4/mvgwJD0Xf+zbqCrgrHg99x8kCvZivZ8qPB3mz
 qHOwlwZm8bRZMbfzF1b7wd/s07pDXvOdWPHzFIJUQJNumnuEZOfEa/ymtulsPZrFDpw3c1kXG
 GTblagv0vvEI3G1HC20D4pgXfWXtZUrDCyM/uhFJHAQT82GuffioWuqi/TrbUMbVx/ddHARO7
 Wy+4Ctod2dCSCc+fCsztnnWD+0YuE6GIYiLEoQhvV1aGT3aqvffvLvn8MKUA/tmuyxighUtxE
 XS7Kjl203+DFpFSzUdPJxZjLuthQ4o+2m8LE2EmsipqiMjYMfNhflqH8RSGC94Uue1nLrmEo0
 QKtme94l7SbIOf7941g/DycH6gMER/KjPCnCH/gUoxqzKzByq4CqIGClIo3wM43CcPdkes1SY
 vyRVj8shLGc6ENDDvaumY3iTL56GDzZ+Jw1XHLVATd96xtXUrE/GuVUehd4ipAsfzFi3LW8/J
 Gf9Yy9jbdrnAMSpuuTIGq75+1ck=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/21/22 08:49, Michael Tokarev wrote:
> 20.12.2022 23:56, Helge Deller wrote:
> ..
>> Given that info, would it then make sense to keep as is:
>> =C2=A0=C2=A0=C2=A0 --enable-system
>> =C2=A0=C2=A0=C2=A0 --enable-user
>> =C2=A0=C2=A0=C2=A0 --enable-tools -> qemu-bridge-helper, vhost-user-gpu=
, virtfs-proxy-helper, virtiofsd
>> =C2=A0=C2=A0=C2=A0 --enable-guest-agent -> guest agents=C2=A0 (option i=
s there already, but not used)
>> and additonally add:
>> =C2=A0=C2=A0=C2=A0 --enable-utils=C2=A0 -> qemu-img, qemu-io, qemu-nbd
>
> tools and utils is confusing, it smells like it's the same thing.
>
> I understand that in theory, eg virtiofsd can be used without qemu, with=
 some
> other software, but in practice there's no such software, and I don't th=
ink
> it will emerge in a (near) future. All the "tools" listed above are syst=
em-mode
> helpers really, this is why I package them in qemu-SYSTEM-common in Debi=
an.
> They're not very useful for now without some of qemu-system-xx.=C2=A0 To=
 my view,
> these should be part of --enable-system, at least for now. Maybe with a
> separate --enable-system-helpers to turn them off if needed but I don't
> think it's necessary.
>
> The new "utils" category above actually *is* useful by its own, especial=
ly
> qemu-nbd, for example to access .qcow2 images from the host OS. This is =
what
> eg Redhat is shipping in qemu-io package.=C2=A0 And these are good to ha=
ve without
> --enable-system.

Michael, please note, that the patch I initially sent in this thread is
*exactly* doing what you summarize here.

Helge

