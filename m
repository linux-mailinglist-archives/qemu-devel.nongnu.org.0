Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F5697F61
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJYQ-0002XQ-6r; Wed, 15 Feb 2023 10:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenneth-lee-2012@foxmail.com>)
 id 1pSDRg-0006sK-EF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:47:20 -0500
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenneth-lee-2012@foxmail.com>)
 id 1pSDRd-0006wD-O1
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1676450828;
 bh=sBN9WNdoj2cryZhvqJgaMG0MKK7m2CTun48CyEdAh20=;
 h=Date:From:To:Subject;
 b=u6us9h4qhoVYitANghL2HlwDU++a0mkWFoq3oL9Rl4nnjWUE6S1zdiBrXfujDUCGn
 nXS6klaxaHFuZ4tM9PBoJLS9QjqaYBi4pR+CXOEJ0B0p4+rg5MwrA8JQ8gEi7hYeNr
 aWD7F/LlmUo/LfJb6sgXjBJ3wxDlTrHbUyHorBvw=
Received: from localhost ([2409:895a:d877:faa8:9d68:f780:102e:33bb])
 by newxmesmtplogicsvrszc2-1.qq.com (NewEsmtp) with SMTP
 id 9F399E0E; Wed, 15 Feb 2023 16:39:51 +0800
X-QQ-mid: xmsmtpt1676450391togeei5gn
Message-ID: <tencent_F8004464D432CD4CABBADFE9E9493EDF9607@qq.com>
X-QQ-XMAILINFO: NwU0tZNR0OQKeFVaMPFgO2Pp3lGFoxJxBgpcfyo2AaTB0TpWIjPSZfpxgsALuv
 r1IR5D3128wYNkj+SG++/hjPG/JrTJNchBJ3DCVjs1IGyYupeJmHJJKju8inoEX4WsFsBPkmCZ3N
 G74F8qk7VT8JYaJ6A73RYQ0DyMEHMsM8KlnD6YKKBqqU/TzwGLN6wqXu8hDtzsoBc44pyTnqrD4q
 vFnbWKUYzeWP09CXjvoj1gdb8KFlHOdZfOsR1/OS48vRSHOLMPI3/TKZsTmax6SVDFcoVFYiZevS
 iUOSbNWGb0IwiC93/iINaGKl9EkiHNFm6My797Ld1O2anOz1ScGDgCSjp98uo2Av+d5Ku1HUEiab
 Da7NietUDipd4Y5Y6hOb/W71K9UUwW+iC6sMC+cbxmjuEhPaDtLqdwMyfxWbDKad7yBY70riJBlV
 VHFK1xWkVqyHedHzMiRekoWLDJjZCsss/p/8AWJzu8KXBegz0M32FLPeLtdSb7/ctzd3dKa39wOk
 orB/MwQKiCIKmEH+sXx4jMEbbkXfsxrs+6/kS1cD4unN8NZiPs9bHofEmSao1bEwypFKMFm8c0vW
 RcacqXQ0XDg0B3wUwvFT+MmIucSTQMJlotIP1Bkb/aAsLb993/a9lNESpetYsEND4hCu9U2qSaC0
 Rbjb4M9hJCeC3W8gzSdKVs4Ktduxj80CwVt51hTaU0QUAKr2j/rmLboRy4IexzGbzA+pC50ftcXa
 wvOYlaghzne/fOl+hHi9unvBclXPJINeq0HwxBDnuiGNiZEts4WVwJbR65zWCrAjEYXqDY4d3iUk
 6Wf2qJM9ffynzUMTat/t+zInXKAyh/7GmgJmoC552GZYi6qFuJ3O2pLTBR3hulofqW4Ek+BMNWcp
 g6d+Bxx8BHmxdrRpdj9NKefTqABl6DGvCowuknrt3Gv02Bt5VtCOgZCOW5gJ1tHYwFoaXf73a88b
 cyWX6IlMbRpyqBUBQusb2SUmTrrHN5jJiJwDSfC8q+gNd8ZVhSRvvzVsT7bxmU
Date: Wed, 15 Feb 2023 16:39:51 +0800
From: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
To: qemu-devel@nongnu.org
Subject: Does the page boundary check still necessary?
X-OQ-MSGID: <Y+yaVynzg4RdGNnE@lklp02>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=203.205.221.231;
 envelope-from=kenneth-lee-2012@foxmail.com;
 helo=out203-205-221-231.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Feb 2023 10:18:35 -0500
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

Hello,

I hope I send this mail to the right place.

I'm porting a new guest arch. It jumps of out of physical page
constantly. So many TBs cannot be chained with goto_tb. I'm wondering 
if the following check is still necessary?

	bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
	{
	    /* Suppress goto_tb if requested. */
	    if (tb_cflags(db->tb) & CF_NO_GOTO_TB) {
		return false;
	    }

	    /* Check for the dest on the same page as the start of the TB.  */
	    return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;    <--- Is this check really necessary?
	}

Now the chained TBs have been link with tb_link_page(), the chain will
be rebuilt if it is invalidate on page. So why is this check still there?

Acutally, I have tested some use cases with this check removed. It works
fine. Could anybody tell me in what case it is still necessary?

Thanks.


-- 
			-Kenneth

