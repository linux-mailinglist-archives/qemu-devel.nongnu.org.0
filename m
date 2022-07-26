Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65068581449
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:36:56 +0200 (CEST)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKk3-0004ce-EH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hao.xu@linux.dev>) id 1oGJbj-00050M-9w
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:24:15 -0400
Received: from out0.migadu.com ([94.23.1.103]:55658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hao.xu@linux.dev>) id 1oGJbg-0008Jt-Pk
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:24:14 -0400
Message-ID: <4f2c71a4-609e-6880-04d0-2eb127c55023@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1658838243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RyjAJBrvN+/oTicKai/HbICAmWdsr5+c6kqiYEOCxc4=;
 b=oG+u2ifJTVH5gWSxhZcJ4W75T4wJ6Jx6fKq9twx0Rc7trmzTty6UIbjFn77BL5XZapebEk
 MoNWkziXbbHyBC7AJFlKwMqxMACEqDQJUz2PurJ5Savn1rw4yELZ8y2PMpdPM38G6yXEma
 iAFUM6QDptR0Ph1tbrG2oG0OiPHkGCk=
Date: Tue, 26 Jul 2022 20:23:56 +0800
MIME-Version: 1.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
Subject: Question about performance comparison between virtio-fs and virtio-blk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Received-SPF: pass client-ip=94.23.1.103; envelope-from=hao.xu@linux.dev;
 helo=out0.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Jul 2022 09:26:54 -0400
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

Hi Stefan,

I watched your presentation about virtiofs in 2020,

https://www.youtube.com/watch?v=EIVOzTsGMMI&t=232s

which is really helpful to me, but I have a question about the graph at 
3:53, could you give

me more info about the test, like what tool you use for the test, if 
it's fio, what is the parameters.

I used fio to do randread test in a qemu box, but turns out the iops of 
virtio-blk and virtio-fs are similar.


Thanks,

Hao


