Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A31C7E6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 13:40:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQVn5-00029z-K8
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 07:40:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hQVdy-0004vW-RK
	for qemu-devel@nongnu.org; Tue, 14 May 2019 07:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hQVdx-0000WA-1N
	for qemu-devel@nongnu.org; Tue, 14 May 2019 07:30:50 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:46376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hQVdw-0000UJ-Gs; Tue, 14 May 2019 07:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=zeRhDyuOgbos4V2gRSVpS+hp9CKkviEcnuxA8WAfoMs=; 
	b=cIn0I/wfwJLmZIeU2BcZQR67mKrGUOqqPG20dXrWPHTZ4Wzx0gv266XOKE5Q83vlwS4QvSr1Q9i0CHN4wBgfN6x7sVlyR/BIPX8e6eu2aOwzNitYwthKRYopSeHyom2L83Rf7WJpAPysk1ioo+1PlzGKTocQj64+zYCXq93DITFrAhjCjWJl8ERNC50/bP/5BJiqRAOLvMCecjLnxMcoZybIKmWQz1r3df/KM9IzoO7hXHMZQTGYvBCqCV5wRgTT3lGoBRbpeD/vpoLeaBGIN5FBDRTg9HP7XQtPlU2IjboeV9nzqRWII9+QYb5eJWIljowhY4x49/F57kKEb3SOog==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hQVdr-0007BV-VC; Tue, 14 May 2019 13:30:43 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1hQVdr-0001KI-Sh; Tue, 14 May 2019 13:30:43 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
In-Reply-To: <5f16da0c-d689-b06c-883b-3911a2c9ff9d@redhat.com>
References: <cover.1551895813.git.berto@igalia.com>
	<e25b416f8646a476017f21a8484a05931b0e3f5a.1551895814.git.berto@igalia.com>
	<1df28c23-7efe-310d-2955-432b9a4bb1ad@redhat.com>
	<w515zrkveul.fsf@maestria.local.igalia.com>
	<5f16da0c-d689-b06c-883b-3911a2c9ff9d@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Tue, 14 May 2019 13:30:43 +0200
Message-ID: <w51k1etqnmk.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH v2 13/13] qemu-iotests: Test the
 x-blockdev-reopen QMP command
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat 13 Apr 2019 02:53:42 AM CEST, Max Reitz wrote:
>> Calling x-blockdev-reopen without 'backing' should only fail if
>>=20
>>  a) the image has a backing file attached to it.
>>     In this case it doesn't: we just detached it in the previous line.
>>=20
>>  b) there's a default backing file written on the image header.
>>     In this case there isn't (hd0 is created without one in setUp()).
>
> That=E2=80=99s what I thought, too, hence me applying effectively the same
> change to the test in v4 of my series as you in your "Fix check for
> default backing files" series:
>
> http://lists.nongnu.org/archive/html/qemu-block/2019-04/msg00308.html
>
>> So it should not fail. I think the bug is that the test for condition
>> (b) in bdrv_reopen_prepare() that returns "backing is missing..." is
>> using backing_file but it should use (correct me if I'm wrong)
>> auto_backing_file.
>
> Well, I think both should be fine, because...

Why would both be fine? backing_file refers to the backing file
currently attached, and auto_backing_file refers to the one written on
the image metadata, or am I wrong?

>> Not directly related to this, but should bdrv_backing_detach() also
>> clear backing_file ?
>
> ...I don=E2=80=99t think it should.  That=E2=80=99s what that my patch ad=
dresses. The
> real problem is that bs->backing_file is not a cache for
> bs->backing->bs->filename, so it shouldn=E2=80=99t be treated as such.

But what's the point of having backing_file set if no backing file is
attached?

Berto

