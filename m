Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DF233D26
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 04:26:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXz9u-00029w-Cw
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 22:26:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hXz8x-0001qd-KM
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 22:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hXz8w-0002nU-Fd
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 22:25:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:37665)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hXz8w-0002gE-2y
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 22:25:42 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jun 2019 19:25:37 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga007.jf.intel.com with ESMTP; 03 Jun 2019 19:25:36 -0700
Date: Tue, 4 Jun 2019 10:25:07 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190604022507.GA25530@richard>
References: <20190528014703.21030-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528014703.21030-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-devel] [PATCH 0/4] Multifd Cleanup
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, David

Do you prefer I resend 3/4 or it is ok for you to pick up here directly?

On Tue, May 28, 2019 at 09:46:59AM +0800, Wei Yang wrote:
>Just found several small places for unused variables.
>
>Wei Yang (4):
>  migration: multifd_save_setup always return 0
>  migration/ram.c: use same type in MultiFDPages_t to define offsest
>  migration/ram.c: MultiFDSendParams.sem_sync is not really used
>  migration/ram.c: multifd_send_state->count is not really used
>
> migration/migration.c |  7 +------
> migration/ram.c       | 11 +----------
> 2 files changed, 2 insertions(+), 16 deletions(-)
>
>-- 
>2.19.1

-- 
Wei Yang
Help you, Help me

