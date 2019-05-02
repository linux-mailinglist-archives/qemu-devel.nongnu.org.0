Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6602F1107D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 02:11:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLzKJ-0000vi-6c
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 20:11:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hLzJI-0000FV-Nw
	for qemu-devel@nongnu.org; Wed, 01 May 2019 20:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hLzJH-0001SN-Hg
	for qemu-devel@nongnu.org; Wed, 01 May 2019 20:10:48 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1hLzJH-0001JL-8C
	for qemu-devel@nongnu.org; Wed, 01 May 2019 20:10:47 -0400
Received: by mail-ed1-x544.google.com with SMTP id w37so595764edw.4
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 17:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=I5Q+4DZ3qW2Cf+NpK3TmwdCjzqrmIVnli6Li3VA5L8U=;
	b=bcFzLLujS+2sKnODNaJyXYjIxGi4mMMRd876FRWl7NpqMbKxtHcOC9uOh0qeFJ36yw
	kNO2fFaISJQXqf1e098fxe+Yp8T9NJK4GnOoRA9n8Y8vnZp79wregwBG5tFJt3XNcvAJ
	bLeZznjFqU8GmCwtBBeyqRENYKnvi3ztQMeXROvJevVlFriWOWJSYA0wqFsrY+NX8P56
	wZnH0inyk0znbREmV6MisSZ3J8dAKgvDTgTcXhK4Jake20TxBXCmf6bpXD/9fGMjUZae
	W49z9+Ayp67X99w/dRk1J7UE3ssOzkzz2HooE4vvssEkqZh8CVko2zWxJNrYe7IAmHV0
	guXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=I5Q+4DZ3qW2Cf+NpK3TmwdCjzqrmIVnli6Li3VA5L8U=;
	b=Ue48K0RuF3mNYmAGJJbzRHlESVhsj5ikVmf5TbtNOkGsI/XRm+hlvvp4/r8qxXqqiU
	P0fm5gkHsqxgskjVErqNmDZbuxelnTSnFtddWc6EL2LJ1OL5nbJrRwqttqm5DKGHqfD3
	/XWlywRVO09p5Ngt4X2CoHmCvaU7yJuoet97U22Bz1Kldg9EOsoocjtAfBSDfmGLLkt7
	+5rO48xZB+tc4nfcEHs3NYbqSs4NOphWHQXsgYgwAIxeXQkicPiTdrgGH79DMCiJjfrb
	tNm15YhFF0HcFzsOobU9azn7L2MOQQvZkuwcP0inFtoL6pZ9ArE9hTCjmQMrme7WTYyM
	BRzA==
X-Gm-Message-State: APjAAAXvAElo/2YWYeMCrbOUmcSP7kUf75RbGNZbckqpa3ZjjqghseZq
	j5UiHplXsQrs7exh4Slag5uzVS95
X-Google-Smtp-Source: APXvYqxA+zqEg+xIyMbkg24KxoiFobzPdIuqnatxoIwW4rJbiqDwVGPdSY8NBdcBqDSBdTSJHTun+w==
X-Received: by 2002:a50:896b:: with SMTP id f40mr537710edf.152.1556755828863; 
	Wed, 01 May 2019 17:10:28 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	k18sm1448107eda.92.2019.05.01.17.10.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 17:10:27 -0700 (PDT)
Date: Thu, 2 May 2019 00:10:26 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: qemu-devel@nongnu.org
Message-ID: <20190502001026.s4kit4ygz7mqdbgt@master>
References: <20190430034412.12935-1-richardw.yang@linux.intel.com>
	<155675118046.10667.9255070406416571267@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155675118046.10667.9255070406416571267@c2072b67cc0c>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 0/3] Cleanup migration/ram.c
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: fam@euphon.net, pbonzini@redhat.com, richardw.yang@linux.intel.com,
	dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 01, 2019 at 03:53:01PM -0700, no-reply@patchew.org wrote:
>Patchew URL: https://patchew.org/QEMU/20190430034412.12935-1-richardw.yang@linux.intel.com/
>
>
>
>Hi,
>
>This series failed the docker-mingw@fedora build test. Please find the testing commands and
>their output below. If you have Docker installed, you can probably reproduce it
>locally.
>
>=== TEST SCRIPT BEGIN ===
>#!/bin/bash
>time make docker-test-mingw@fedora SHOW_ENV=1 J=14 NETWORK=1
>=== TEST SCRIPT END ===
>
>
>
>
>The full log is available at
>http://patchew.org/logs/20190430034412.12935-1-richardw.yang@linux.intel.com/testing.docker-mingw@fedora/?type=message.

Where can I see the test case?

>---
>Email generated automatically by Patchew [https://patchew.org/].
>Please send your feedback to patchew-devel@redhat.com

-- 
Wei Yang
Help you, Help me

