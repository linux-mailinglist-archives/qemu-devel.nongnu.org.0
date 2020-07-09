Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5147219F9F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 14:08:11 +0200 (CEST)
Received: from localhost ([::1]:45696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtVLW-00049Q-Uu
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 08:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1jtVKj-0003hq-Um
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 08:07:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:57608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1jtVKh-0000Fj-U6
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 08:07:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B224AE1A;
 Thu,  9 Jul 2020 12:07:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 09 Jul 2020 12:07:16 +0000
From: Lin Ma <lma@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Questions about online resizing a lun passthrough disk with
 virtio-scsi
In-Reply-To: <3c1d7530-91bf-4e6b-c53c-06e6c5b31cac@redhat.com>
References: <af3e33e4a5bb15d9f0b30c8de4941a37@suse.de>
 <a1d96da7-444e-d3b0-abd5-63cdab92e869@redhat.com>
 <bb1050f276b9f0a6447f64f1e31b69c9@suse.de>
 <3c1d7530-91bf-4e6b-c53c-06e6c5b31cac@redhat.com>
User-Agent: Roundcube Webmail
Message-ID: <63667cb090057140f377ec76ef85c723@suse.de>
X-Sender: lma@suse.de
Received-SPF: pass client-ip=195.135.220.15; envelope-from=lma@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:20:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-07-09 12:00, Paolo Bonzini wrote:
> On 09/07/20 13:52, Lin Ma wrote:
>>> It's not recommended however, because block_resize will report the
>>> change to the guest directly with a CAPACITY HAS CHANGED unit 
>>> attention
>>> condition.
>> 
>> Got it, The 'block_resize' is the recommended or necessary step, Even 
>> for
>> passthrough disk online resizing.
> 
> If your target is able to report the unit attention itself, it is okay
> to skip it.  AFAIK drivers/target/ doesn't, though.

Got you.
I happen to use the drivers/target/ :-)

Thank you very much,
Lin

