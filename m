Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C26497084
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 08:42:44 +0100 (CET)
Received: from localhost ([::1]:57796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBXWM-0005tB-Ik
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 02:42:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lslboyfuture@icloud.com>)
 id 1nBUr4-0003uP-9L
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 23:51:54 -0500
Received: from pv50p00im-ztdg10011201.me.com ([17.58.6.39]:38322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lslboyfuture@icloud.com>)
 id 1nBUr2-00032Z-OL
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 23:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1642913510;
 bh=ZCqh7e7UPW0nMSdu0jJwZKEZqZTywKGMgEeWyw8ekvw=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=QaPORz/1bR2Yo9HdY0aDBtkiO3PS6iwXtJ/YXWMfMCU4Noug2qsUpJ6kSqZO2LcNL
 IdlrvX9h+cCXg0QyWWZZwJNXxfSxTfo7Pi5E51iAVXL7nr6eS6xexrcY3pO1bdl8W5
 qW/n2KXs6Lbg8VvOV1zzEVXhMoWM2KQbjaym5IgANZa6Rdz04EAqt/Js/8SYDraiL7
 erFAJXLa89A4VXhVWQcWbLZrJIoQALAQ1GI7r10BO5ZUxn2ddJt0mGUdfLL8fsipB+
 FUQfuVs2E/vTXvcIFaxS96IGZ4THk+Nq54cOMSvviWw6xyToKMECUmEf8zEbbrK3y/
 nckoaM8o5Tqdg==
Received: from pv50p00im-ztdg10011201.me.com (pv50p00im-ztdg10011201.me.com
 [17.58.6.39])
 by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPS id 2E391680465
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 04:51:49 +0000 (UTC)
Received: from gy11p00im-quki08153201.gy.silu.net (unknown [10.228.125.138])
 by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPS id A64E268045F
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 04:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1ca1ba; t=1642913507;
 bh=ZCqh7e7UPW0nMSdu0jJwZKEZqZTywKGMgEeWyw8ekvw=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=TTegW6DR66azuf7pLiPQhODTmmn0C9g69bS9Di47fwXK+xMYOSUPJMlesySQQVmKZ
 fPp/bJ7KxNDIrTIV+jxw1gomqwFU/6K15uCK/3hJzorAGanJfXFvhuy7aNkyukXKDG
 JaeipqjCgKKvkB3vLpsZNnrysvXRk6tr6av0Xl5zXdstLumTVH04nKBm06DNGRmrvY
 SZJ9fAgKra25zdyNcZFbGw7grKFvmBRXhHwE1pQ0xF2+ayeKwrtJ8tAR/AfS3X66+D
 NasHfIdJMpSD6X1b8TpORLMeObFzQQ/9bMNUDl2MWYlRmD4ctF6Dql0VIcUCnOdq98
 Ql8mnmFoSnGgw==
Received: from smtpclient.apple (unknown [115.227.250.32])
 by gy11p00im-quki08153201.gy.silu.net (Postfix) with ESMTPSA id 413B22E800A1; 
 Sun, 23 Jan 2022 04:51:45 +0000 (UTC)
From: =?utf-8?B?5p2O5aOr5p6X?= <lslboyfuture@icloud.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v8 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Message-Id: <0CE826F5-EEF8-4D1A-975A-7BBAB29FAA51@icloud.com>
Date: Sun, 23 Jan 2022 12:51:43 +0800
Cc: akihiko.odaki@gmail.com, armbru@redhat.com, eblake@redhat.com,
 hello@adns.io, hsp.cat7@gmail.com, jasowang@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, qemu-devel@nongnu.org,
 r.bolshakov@yadro.com
To: yaroshchuk2000@gmail.com
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-01-23_01:2022-01-21,
 2022-01-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=805 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2201230038
Received-SPF: pass client-ip=17.58.6.39; envelope-from=lslboyfuture@icloud.com;
 helo=pv50p00im-ztdg10011201.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 23 Jan 2022 02:36:20 -0500
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

Hi:
    I develop a custom os use qemu and use macos as host, I use the net =
argument '-net nic,model=3Dpcnet -net =
tap,ifname=3Dtap0,script=3Dno,downscript=3Dno=E2=80=99 when run the =
qemu-system-i386,then I can get the network device in my custom os:

    pci_device_dump: vendor id:      0x1022
    pci_device_dump: device id:      0x2000
    pci_device_dump: class code:     0x20000
    pci_device_dump: revision id:    0x10
    pci_device_dump: multi function: 0
    pci_device_dump: card bus CIS pointer: 0
    pci_device_dump: subsystem vendor id: 0
    pci_device_dump: subsystem device id: 0
    pci_device_dump: expansion ROM base address: feb80000
    pci_device_dump: capability list pointer:  0
    pci_device_dump: irq line: 11
    pci_device_dump: irq pin:  1
    pci_device_dump: min Gnt: 6
    pci_device_dump: max Lat:  255
    pci_device_dump: bar 0:
    pci_device_bar_dump: type: io base address
    pci_device_bar_dump: base address: c000
    pci_device_bar_dump: len: 20
    pci_device_dump: bar 1:
    pci_device_bar_dump: type: mem base address
    pci_device_bar_dump: base address: febd1000
    pci_device_bar_dump: len: 20

I can send a message to the host from my custom os in qemu, but can=E2=80=99=
t receive a message from the host.

so I rebuild the qemu use this patch, then I use the argument '-netdev =
vmnet-bridged,id=3Dvmnet,ifname=3Den0=E2=80=99 run the qemu-system-i386 =
again, this time, I can=E2=80=99t get the network device either, I =
don=E2=80=99t know why, how to use vmnet-bridged to send message to host =
from my custom os and receive a message from the host, what should I do? =
thanks a lot!=

