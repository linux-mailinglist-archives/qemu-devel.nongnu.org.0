Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D1536462B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:32:39 +0200 (CEST)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUx4-0007xR-OL
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lYUv8-0006UL-9c
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:30:38 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:51467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lYUv4-0000pW-JO
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:30:38 -0400
Received: from [192.168.100.1] ([82.142.18.94]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXpM2-1l0UTk3lFs-00YBN3; Mon, 19 Apr 2021 16:30:25 +0200
To: Stefan Weil <sw@weilnetz.de>, Bug 1924912 <1924912@bugs.launchpad.net>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <161875180735.23175.14682430598239905387.malonedeb@wampee.canonical.com>
 <161875645795.6320.1996793877758730269.malone@soybean.canonical.com>
 <9bb9996e-d7ac-44c5-2fd3-13f2a4d1c802@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [Bug 1924912] VirtIO drivers don't work on Windows: "GLib: Too
 many handles to wait for!" crash
Message-ID: <b48d2719-d334-2c16-be32-f3df52d415c7@vivier.eu>
Date: Mon, 19 Apr 2021 16:30:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9bb9996e-d7ac-44c5-2fd3-13f2a4d1c802@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zZuRbC/qjDuPPVs72i8RvrOGMAgA/3cwbe3WkhuCAdBsD+C4QTw
 5enzaM+oJD+/GZuXpZzusRWeUs/RkSR6URFTsqwknf2+uMNTjvrRdA4N4QVpcK7Z7Jku752
 iOh8bbRRCTChJW62F16p4lY+VRQlUCk/MVTvukIyZx1HQbo7ct7uHKw3+ZbMj1y+GZC2p4O
 tcYDPwqylBFZE4lAGzsIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1C9XnfNLvww=:h7ohuh1OKkxRNiihpAZ+eR
 MnVk6dDAC8pFQIbgar5BeA6EqQrCivpF+69smatGqcC5gZAfAStXXt/xoE3lw7IcJupp99VUJ
 VqoGzh2AKNN7tCPHrqthO0v+J3LIXzLbvM9zhKgJNBUV8mbVJMyR8Z/SdJYapeCoVrkydhmHS
 Kl/BlBW3dZuumVLT6QMvJf9QRuSSjEKOOHp9UUZ1evGmDuRv44fp3OL2fBJPeK4bpKX/vHA2j
 /QxbyxXN/s3wmxQ6bWslWun/xfe2Nc5hAZCHs+TS0KDozpQ4cqGHH9ncY9G2T7R98PvZV4w1s
 wWXb52rgUdV5IkJHJobAimYZw53OAVt8hvpYSduaC5ATzL5etGk/vpQlkyVpZOH1mGoiRjQk7
 hB0LQyL7BXeWCN1hA2QSuZTfZpcgSgaHmiaUpcTEe4svl/9rbsM4efWmnJPVU/9RAExwm/rYl
 iYF4tMhxe98fDuYoo3+muEPw7jnbq1HT4EOx25L7kbaLiITAAqpre55WP/ARuk7NGowHdWZzl
 XYGmeHMWufdNQ7GC+Ht9gI=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 19/04/2021 à 12:39, Stefan Weil a écrit :
> I can confirm the issue also with latest official QEMU sources.
> 
> Related issue URLs:
> 
> https://github.com/tesseract-ocr/tesseract/issues/2838
> 
> https://bugs.launchpad.net/qemu/+bug/1924912
> 
> Instructions and files required to reproduce the issue:
> 
> https://qemu.weilnetz.de/test/bugs/1924912/
> 
> Michael, Laurent, maybe you have an idea how to narrow down this issue?

Could it be related to the number of file descriptors that can differ between linux an windows?

We have a series of patches that sets the number of queues to the number of vCPU:

a4eef0711b2c vhost-user-blk-pci: default num_queues to -smp N
9445e1e15e66 virtio-blk-pci: default num_queues to -smp N
6a558822849f virtio-scsi-pci: default num_queues to -smp N
4e5163bd8444 virtio-scsi: introduce a constant for fixed virtqueues
1436f32a84c3 virtio-pci: add virtio_pci_optimal_num_queues() helper

And I think it can have inpact on the number of open file descriptors.

You can try by specifiying "num_queues=1" with the virtio interfaces on the QEMU command line.
(ot choose a machine type earlier than 5.2)

Thanks,
Laurent

