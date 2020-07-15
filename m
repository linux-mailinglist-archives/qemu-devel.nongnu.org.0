Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DC221519
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 21:28:17 +0200 (CEST)
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvn4i-0000pm-KI
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jvn3w-0000JA-7D
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 15:27:28 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:47578 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jvn3u-0002jj-MU
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 15:27:27 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 936F54C8F8;
 Wed, 15 Jul 2020 19:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1594841242; x=1596655643; bh=lx2aqtn/jkaBS4uRrDnQ3E
 wUb1Ns7Xc0mz4Z6F+/mes=; b=S+trvLNzo1IUX/lRnWMjKgEH2+KBKUSCz6rprq
 8PpcxnKoxXvaduDha+A+xNEAUMSm6K89gXi0F1eLGbgzhKUdTyVXE8gBIatHLa8H
 G0YCS6rCkHofI5N//WxJa7J3nhbdLLJBPE/sRM+u7a2Po7/iGxbAfasodB2188dZ
 H6zfE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4v0C9WWvlEe; Wed, 15 Jul 2020 22:27:22 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5270E4C8A0;
 Wed, 15 Jul 2020 22:27:22 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 15
 Jul 2020 22:27:22 +0300
Date: Wed, 15 Jul 2020 22:27:21 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH-for-5.1] net/colo: Remove unused trace event
Message-ID: <20200715192721.GD90799@SPB-NB-133.local>
References: <20200715143130.11164-1-philmd@redhat.com>
 <20200715151302.GE88416@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715151302.GE88416@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 14:36:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: zhangchen.fnst@cn.fujitsu.com, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 15, 2020 at 04:13:02PM +0100, Daniel P. Berrangé wrote:
> On Wed, Jul 15, 2020 at 04:31:30PM +0200, Philippe Mathieu-Daudé wrote:
> > Unused trace event cause build failure when using the dtrace backend:
> > 
> >   "probe colo_compare_miscompare doesn't exist"
> > 
> > Fixes: f4b618360e ("colo-compare: add TCP, UDP, ICMP packet comparison")
> > Reported-by: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> Note Roman indicated on IRC that this is seen with dtrace on macOS and
> there were other problems too.
> 
> Unless someone knows that QEMU's dtrace support worked on macOS in the
> past, I think we don't need  and simply consider dtrace unsupported on
> macOS right now until someone can get it into more robust shape on
> macOS.
> 

Hi Daniel,

I've got it working and I can see qemu trace points from
  sudo dtrace -m qemu-system-x86_64 -l

I'm wrapping a series that resolves all the issues along the way.

Thanks,
Roman

