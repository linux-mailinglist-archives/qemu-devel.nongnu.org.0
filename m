Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1904D130B79
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 02:29:56 +0100 (CET)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioHDP-0007ko-3l
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 20:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ioHCd-0007KD-4m
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 20:29:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ioHCc-0001WR-8S
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 20:29:07 -0500
Received: from mga06.intel.com ([134.134.136.31]:11230)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1ioHCb-0001VC-Vk
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 20:29:06 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jan 2020 17:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,400,1571727600"; d="scan'208";a="222123939"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga006.jf.intel.com with ESMTP; 05 Jan 2020 17:29:03 -0800
Date: Mon, 6 Jan 2020 09:29:05 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Patch v2 0/6] migration/postcopy: enable compress during postcopy
Message-ID: <20200106012905.GB15834@richard>
References: <20191107123907.29791-1-richardw.yang@linux.intel.com>
 <20191216023502.GA21865@richard> <20191218195538.GW3707@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218195538.GW3707@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 18, 2019 at 07:55:38PM +0000, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> Would this one be picked up in this version?
>
>I think that one is on Juan's list for the pull he's going to do soon.
>
>Dave
>

Happy New Year to all~

May I ask the plan for this patch set?


-- 
Wei Yang
Help you, Help me

