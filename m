Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B159D144BE8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 07:45:56 +0100 (CET)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu9lz-0002dp-PE
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 01:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1iu9l5-0001zV-TI
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:45:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1iu9l4-0002PW-3q
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:44:59 -0500
Received: from mgwkm02.jp.fujitsu.com ([202.219.69.169]:64041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1iu9l3-0002N0-Kc
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:44:58 -0500
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
 mgwkm02.jp.fujitsu.com with smtp
 id 138c_7c93_14c39fed_6905_4080_9d0c_b60f2a2345cd;
 Wed, 22 Jan 2020 15:44:50 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
 (g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
 by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id CE9EDAC007F
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 15:44:49 +0900 (JST)
Received: from g01jpexchkw33.g01.fujitsu.local (unknown [10.0.193.4])
 by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id CB082BD678B;
 Wed, 22 Jan 2020 15:44:48 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchkw33.g01.fujitsu.local (10.0.193.36) with Microsoft SMTP Server id
 14.3.439.0; Wed, 22 Jan 2020 15:44:49 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To: <dgilbert@redhat.com>
Subject: Re: [PATCH v2 015/109] virtiofsd: Add options for virtio
Date: Wed, 22 Jan 2020 15:53:37 +0900
Message-ID: <20200122065337.1025-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121122433.50803-16-dgilbert@redhat.com>
References: <20200121122433.50803-16-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.219.69.169
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
 misono.tomohiro@jp.fujitsu.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 philmd@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add options to specify parameters for virtio-fs paths, i.e.
> 
> ./virtiofsd -o vhost_user_socket=/tmp/vhostqemu
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

