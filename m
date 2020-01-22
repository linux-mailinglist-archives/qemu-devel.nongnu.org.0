Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74756144A0A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 03:50:01 +0100 (CET)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu65f-00055p-W7
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 21:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1iu64j-0004fJ-02
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1iu64h-0002Qn-Qm
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:49:00 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:56534
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1iu64h-0002P8-G3
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:48:59 -0500
X-IronPort-AV: E=Sophos;i="5.70,347,1574092800"; d="scan'208";a="82362386"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jan 2020 10:48:54 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 45A1B5010EBE;
 Wed, 22 Jan 2020 10:39:41 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 22 Jan 2020 10:48:51 +0800
Message-ID: <5E27B810.7050605@cn.fujitsu.com>
Date: Wed, 22 Jan 2020 10:48:48 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 006/109] virtiofsd: Trim down imported files
References: <20200121122433.50803-1-dgilbert@redhat.com>
 <20200121122433.50803-7-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-7-dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 45A1B5010EBE.AC962
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 183.91.158.132
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
Cc: m.mizuma@jp.fujitsu.com, berrange@redhat.com, slp@redhat.com,
 qemu-devel@nongnu.org, misono.tomohiro@jp.fujitsu.com, stefanha@redhat.com,
 philmd@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/1/21 20:22, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert"<dgilbert@redhat.com>
>
> There's a lot of the original fuse code we don't need; trim them down.
Hi Dave,

enum fuse_buf_copy_flags is not used by the v2 patch so I think we can 
remove it directly.
See my patch for the detailed info:
https://www.redhat.com/archives/virtio-fs/2020-January/msg00117.html

Best Regards,
Xiao Yang



