Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E61FEFE8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 12:49:28 +0200 (CEST)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jls6p-0002FU-C7
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 06:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jls60-0001jB-6c; Thu, 18 Jun 2020 06:48:36 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:53792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jls5x-0001X3-V7; Thu, 18 Jun 2020 06:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=R9OKi9f7iApLDHeAu133odTXRB4lKVb636FLGwfb4/Y=; 
 b=ZQ10l8VZTqFNMmLcfKstYSoakhDXX0Mjzn/ndgnYEj/678WqNn9aKaMYgGA9GKqshlJ+WPk+ZQ0pdJOj/pj7NWxhUCNx3jxwhepIxikmsSpc5svJsCMwW2kmPFOHWz52WOsTtvd7EiblU8ENdBGa9VmLX8SwK5Ex0a1E0d0rWOib20RaJVQgfbiMDv9fMZ/FxtSZeJNIeZsthZ8xh4var1VNVUlsLwQye9+2W+VzqRg0HHCU64HcyKIIZjO7gH2KjJEFUFat+IUSfJB1VZvTtRcRx1qqmkXMW825CXUsim/1zmIU+tSjgDO8jldhU0fdlVOZ+7EfsBj1WtpEKgIMaw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jls5t-0005Ie-QF; Thu, 18 Jun 2020 12:48:29 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jls5t-0004dh-Ge; Thu, 18 Jun 2020 12:48:29 +0200
From: Alberto Garcia <berto@igalia.com>
To: Connor Kuehl <ckuehl@redhat.com>, kwolf@redhat.com, mreitz@redhat.com
Subject: Re: [PATCH] block: Raise an error when backing file parameter is an
 empty string
In-Reply-To: <20200617182725.951119-1-ckuehl@redhat.com>
References: <20200617182725.951119-1-ckuehl@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 18 Jun 2020 12:48:29 +0200
Message-ID: <w51tuz8tzsy.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 06:48:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 17 Jun 2020 08:27:25 PM CEST, Connor Kuehl wrote:
> Providing an empty string for the backing file parameter like so:
>
> 	qemu-img create -f qcow2 -b '' /tmp/foo
>
> allows the flow of control to reach and subsequently fail an assert
> statement because passing an empty string to
>
> 	bdrv_get_full_backing_filename_from_filename()
>
> simply results in NULL being returned without an error being raised.
>
> To fix this, let's check for an empty string when getting the value from
> the opts list.
>
> Reported-by: Attila Fazekas <afazekas@redhat.com>
> Fixes: https://bugzilla.redhat.com/1809553
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

