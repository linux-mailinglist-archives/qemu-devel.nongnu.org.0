Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8974C20757
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 14:54:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRFtv-0004Sl-Jc
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 08:54:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hRFpI-0000k3-5F
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:49:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hRFpF-0000gc-3b
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:49:36 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:51019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hRFp8-0000E0-96; Thu, 16 May 2019 08:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=33JXPy6AyDdqngPoYdtqQGEwI/C6yjY5/PW0GvoB14A=; 
	b=YFaVAZfStqhvCJ8e4NlFs1oDMtg5IEiO4/cg2xqUoWCnc0W/uIeiQQLDgIcmeR6BfUGsbQ7t6HqOcrMXT+erq9V4KkfHIg2UEn2mhABlbh2A1hX/MGcb2rk8aHPvnV7njJ0s63HS7SuVKg4w5iYjoStjzM09XH2vnPnic/l8lX81mlfBNLSL3KEQqWF/3DjMo3u7KSYwuHnKzCjJl6XgaKRcMr4fHEVe7gBsj2eZ7oky4OyedqmXhdXzQhNVj6M+pzkKCOUF0pZqMzW3LqJ5KkRo+mmG9tr9qi63BQlI9vIWMGhpKtom2aIjAh0jIUOFhgmm0LpvNMNHykDXyXXvZw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hRFom-0005wy-II; Thu, 16 May 2019 14:49:04 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1hRFom-00060s-Fe; Thu, 16 May 2019 14:49:04 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
In-Reply-To: <20190515201503.19069-2-mreitz@redhat.com>
References: <20190515201503.19069-1-mreitz@redhat.com>
	<20190515201503.19069-2-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Thu, 16 May 2019 14:49:04 +0200
Message-ID: <w51ef4yva2n.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH 1/4] block: Improve "Block node is
 read-only" message
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 15 May 2019 10:15:00 PM CEST, Max Reitz wrote:
> This message does not make any sense when it appears as the response to
> making an R/W node read-only.  We should detect that case and emit a
> different message, then.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

