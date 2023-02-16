Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B273698A45
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 02:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSTT3-0004NB-84; Wed, 15 Feb 2023 20:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenneth-lee-2012@foxmail.com>)
 id 1pSTSz-0004N1-TA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 20:53:46 -0500
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenneth-lee-2012@foxmail.com>)
 id 1pSTSv-0004SN-F0
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 20:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1676512410;
 bh=drpfXFT6p2o2a2UDPu219kxIZ0szGlcQ1PvXgHZmOAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=CgR1zk1xZqCHxaajpuMDgZlZG17Dbwt8kxVltG0LgUxWuy3pWdtgik/pvYdaOJ+VW
 sg7Bmz5BnxrrtLoHW19kThcs0Op6GPtK+fDxb0SrmVlU+6/RHWvvl9/qa24abYd4YA
 oKUKZMNmLGcKcQ2RuYQgO2Xcg4vf8c9C4cyWeYpg=
Received: from localhost ([2409:895a:d8f0:d881:b121:5fe6:ac83:96b8])
 by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
 id B4A3F25C; Thu, 16 Feb 2023 09:45:10 +0800
X-QQ-mid: xmsmtpt1676511910th2oqv57f
Message-ID: <tencent_5ED3B1CE709A7A92C2B7264011B9A84C2205@qq.com>
X-QQ-XMAILINFO: OUMxvQDaATietpR+IhZrP7yCTWPrkGBPYCdnv6YurQflBDXiJao/WlsqoQ5x8T
 +EGzuLS+HQxhn84353WigtlGwwJ/7fAVDPJ0pfUh2xL96rek6YbulMG/pSR13kJnwTpd5qYojG7I
 mlvkHQAw4cKrkeQtbc/hURuwD5/t6j2MG2vJClhPMO4wEJfUQsshOfnP7DYB3NsnkxlSvOq3QCA0
 CfccHw/mmATHitkfmm+/1nVvZWAc3YO/PFwicw0rt3NXagcS703Wf6lfSvsmwhNYJFeCPBdzInZZ
 NeHTL/6wRvoX9zKKS51EIjN+4nSTHTAefVjG7OGrFKNxWUX44M3Rh7Iy/1dKSd5oQHmrtZ8pAx2R
 qiuZvlNB2fXwgHdR4n0SBT9DII5mNrt1dAe/w6uHdvEiApTBiwA6+/DEbIqRsKXvKtUDoIvqdqYJ
 nfBdGWwZFOgb2v0Iyr5Unj5P9QXp6vUz3pia3vv6U58MAwPHzYSdHFgUY1dR/zdQZ2HV/dcDp8eo
 NDMKYH1w/p5lyZQzNPzSFSuLO/0qng0Wd/elIU2HOtlYcr7pWKVqAhTgcqwzxIT3820yLPPrlApf
 cSdxler3wlrm59rnHhEsHkJR0bkxSXQSXw7ciMFOROfLv6dKJjZhuS+zoKiOahgfIsHyC7Ib4pS2
 m1NfzLvWR56pmvGFqj7xooaJQmdlHmbxb0Tc7M8OaaLkRCQwc3Rx/6FMo6LM5u4Bfd1STbfucOIA
 44KcRiy959HtRB2SBOCN2mcdZHu4vD+tbln+H9wn9qhSaAKbQLYdvHg/BI5lJkxVlHAF/zqOL6lz
 lpTIloQTZcXhPPEjJQXeJ5B5MRAQenj0KJyTt0Tz3MPNO5JYmzJU15ihb1vYEfOVrzVSGq+QPNo6
 BzkW/tqtMTbzrHq8e+Lo4GCUApChtgToFwmHNyZI+UlHqqw0tdOIxcoSE/ftoySNU5yO+koqfJrK
 7zK6rhLNhtjEKaFCApsw==
Date: Thu, 16 Feb 2023 09:45:09 +0800
From: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: Does the page boundary check still necessary?
X-OQ-MSGID: <Y+2KpWKgra4Tkv45@lklp02>
References: <tencent_F8004464D432CD4CABBADFE9E9493EDF9607@qq.com>
 <b2c5dd7c-5c90-9104-5477-b76ed22ea799@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2c5dd7c-5c90-9104-5477-b76ed22ea799@linaro.org>
Received-SPF: pass client-ip=203.205.221.240;
 envelope-from=kenneth-lee-2012@foxmail.com;
 helo=out203-205-221-240.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

On Wed, Feb 15, 2023 at 07:27:19AM -1000, Richard Henderson wrote:
> Date: Wed, 15 Feb 2023 07:27:19 -1000
> From: Richard Henderson <richard.henderson@linaro.org>
> To: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>, qemu-devel@nongnu.org
> Subject: Re: Does the page boundary check still necessary?
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
>  Thunderbird/102.7.1
> 
> On 2/14/23 22:39, Kenneth Lee wrote:
> > Hello,
> > 
> > I hope I send this mail to the right place.
> > 
> > I'm porting a new guest arch. It jumps of out of physical page
> > constantly. So many TBs cannot be chained with goto_tb. I'm wondering
> > if the following check is still necessary?
> > 
> > 	bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
> > 	{
> > 	    /* Suppress goto_tb if requested. */
> > 	    if (tb_cflags(db->tb) & CF_NO_GOTO_TB) {
> > 		return false;
> > 	    }
> > 
> > 	    /* Check for the dest on the same page as the start of the TB.  */
> > 	    return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;    <--- Is this check really necessary?
> > 	}
> > 
> > Now the chained TBs have been link with tb_link_page(), the chain will
> > be rebuilt if it is invalidate on page. So why is this check still there?
> 
> Even for a guest which doesn't use paging, and therefore does not need to
> worry about memory maps changing, we still enable breakpoints and
> watchpoints on a per-page basis.
> 

Thank you. So is this the only reason? May I write a fine grained
checking to remove this limitation?

> 
> r~

-- 
			-Ken

