Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798A12499
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 00:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMKIU-0007iI-Mp
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 18:35:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hMKHE-0007FY-Gh
	for qemu-devel@nongnu.org; Thu, 02 May 2019 18:34:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hMKHD-00074h-6U
	for qemu-devel@nongnu.org; Thu, 02 May 2019 18:34:04 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:47083)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1hMKHC-00072e-Vz
	for qemu-devel@nongnu.org; Thu, 02 May 2019 18:34:03 -0400
Received: by mail-ed1-x544.google.com with SMTP id f37so3696646edb.13
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 15:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=c9F6/pgQdID7woeVMryiEryzLQaLTgTSO10+5JjecW0=;
	b=lmZCIgonyDQ/M/bwsBglkW/lEXpcfDm3Uc0pTJcpMxJGP8CMSdn6baPpv36ed82NO+
	F8qWYm9OL8Hwu22THIXPga9p/tqa2kOkEd4/iEUdlHPdQJDN81H+QsNrlU/1I/jQusdT
	orJ5mjG/wKdVrPuCiP7NzXjYDJwDkJxqXgKeSdoHnENTB0xOjDnVg97Ybvh91BD6GwX4
	/f2TB08QvGGB+BGYRKdMPUK9zdxZhFGGl+BiAMtkd+3DRX0yMbCPIh3gmd/vHjot2Q/5
	ZWLhkD/JRU2jmorPfrnXADL3iOrS+G4aBVC09NunyPcg3SEriD9cGDcTghwBPHpaNjKh
	XymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=c9F6/pgQdID7woeVMryiEryzLQaLTgTSO10+5JjecW0=;
	b=bIsDamc0pV7WZ0V+NMjqubF85OnNtddQXggdqNVgvT5PPqHTif22oEn8qK3N9rXDzU
	68uvJCyRU+JODoar0sAcuP1zrhe1kJzPVfGQ3Hsv4ZfVNgCCKI7RmCaqhsR7TbsPiTfg
	8lMDiAX21Nfhmu2B3c3Y26M7IRPveZ5SYnqdyM9EU6itVDqb1czKzyCIQmqV3y2sFWPi
	GEl/9yPPGCfWP0jzXyKabkDQ4oAlyBBN1WZG2Vdfqpom3HH0kJkzwdsNucdeR+KNA17+
	Eiz0Z99eJKB9QXnOZqoDiA3ABy6JGYg42jfaY3taTewSlCVlcruA96lsVuXGl895r5po
	KLSQ==
X-Gm-Message-State: APjAAAUna4sQXrMppZRfE69q3PpCipUVGXuzJZDHZifDTgxPH2beMu3U
	W9xOQun8OM7A5UEzRFOHE24=
X-Google-Smtp-Source: APXvYqxa3POmTihsR5XLumySuso8UYpo/5C/gZTf4vMHFiG1NeAYfPe3DTxuKCR8ukVoXdxDYeu8Ag==
X-Received: by 2002:a50:89b7:: with SMTP id g52mr4505452edg.291.1556836441756; 
	Thu, 02 May 2019 15:34:01 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id b4sm106044eda.9.2019.05.02.15.34.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 15:34:00 -0700 (PDT)
Date: Thu, 2 May 2019 22:34:00 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190502223400.kr57ek4fogabniin@master>
References: <20190430034412.12935-1-richardw.yang@linux.intel.com>
	<155677104475.10667.17544832182226944733@c2072b67cc0c>
	<20190502053207.ix637eb6v7umujas@master>
	<20190502083550.GA2853@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502083550.GA2853@work-vm>
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
Cc: fam@euphon.net, quintela@redhat.com, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>,
	richardw.yang@linux.intel.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 02, 2019 at 09:35:50AM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richard.weiyang@gmail.com) wrote:
>> On Wed, May 01, 2019 at 09:24:06PM -0700, no-reply@patchew.org wrote:
>> >Patchew URL: https://patchew.org/QEMU/20190430034412.12935-1-richardw.yang@linux.intel.com/
>> >
>> >
>> >
>> >Hi,
>> >
>> >This series failed the asan build test. Please find the testing commands and
>> >their output below. If you have Docker installed, you can probably reproduce it
>> >locally.
>> >
>> >=== TEST SCRIPT BEGIN ===
>> >#!/bin/bash
>> >time make docker-test-debug@fedora TARGET_LIST=x86_64-softmmu J=14 NETWORK=1
>> >=== TEST SCRIPT END ===
>> >
>> >  COPY    RUNNER
>> >    RUN test-debug in qemu:fedora 
>> >container_linux.go:247: starting container process caused "process_linux.go:258: applying cgroup configuration for process caused \"The maximum number of active connections for UID 0 has been reached\""
>> >/usr/bin/docker-current: Error response from daemon: oci runtime error: The maximum number of active connections for UID 0 has been reached.
>> >Traceback (most recent call last):
>> >  File "./tests/docker/docker.py", line 615, in <module>
>> >    sys.exit(main())
>> >
>> 
>> May I ask how I can reproduce this?
>
>To me this just looks like patchew having a problem, I don't think it's
>a real qemu bug.

Ah, thanks. 

>
>Dave
>
>> >
>> >The full log is available at
>> >http://patchew.org/logs/20190430034412.12935-1-richardw.yang@linux.intel.com/testing.asan/?type=message.
>> >---
>> >Email generated automatically by Patchew [https://patchew.org/].
>> >Please send your feedback to patchew-devel@redhat.com
>> 
>> -- 
>> Wei Yang
>> Help you, Help me
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

