Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BEA106F5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 12:25:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLmQd-0007g5-Oa
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 06:25:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLmPQ-0007Gq-Fy
	for qemu-devel@nongnu.org; Wed, 01 May 2019 06:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLmPN-0007f0-Ck
	for qemu-devel@nongnu.org; Wed, 01 May 2019 06:24:16 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41729)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hLmPM-0007e4-Or
	for qemu-devel@nongnu.org; Wed, 01 May 2019 06:24:13 -0400
Received: by mail-wr1-x441.google.com with SMTP id c12so24102995wrt.8
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=YxRpR5V7nv1AFM7Es+4feEQCnUVhr4SuaawMYUUCRdg=;
	b=F/euzwRYf5sb4WtxDX7s80RQP230QlrsNb075UEAKV+7hTSEWm3YSGBVirmxRycVBc
	WzR5O2UCEunXDXDKgEO9XHJPpHR6rq9Bfm+NLxhZH4Yvj03VbY6EFawQ4kIB+CXDhNEN
	GeLenOCB0EUsbKzjOplLMoEcGGDsPeIBOIguYmwfxooDbqBPxzpg3PbsiQ9tWz62WyDw
	NOF9JdWmDRjy0A4fVavfJPfMB0oOs57GH0WyEoVY3/xIGlV+6PBAaEKs3crELuEpVH+n
	sBtWI+xc+l5q/8UIn9JzPE2Sf+d2+bB+7Q3pfM7byVJsxCsfnbvB+x6L+c0eHwYUkubM
	Sf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=YxRpR5V7nv1AFM7Es+4feEQCnUVhr4SuaawMYUUCRdg=;
	b=RGykVH5yVJ51qjWsVkZouSQfhIg333NkRNDIK9AJWBHmNv50Yyz0BnF7B5YNus3fpI
	DTpTNQMoXjbBTk2a0PH+1cyP63WsEkXFXavfo7h3GLephURK66VrP+znNrkDUMU+63+w
	4W2v+qJ+2OFVmMVS0fEKiaguaRsBSSNQVggfQAAOK6LbwvU1jqNRFZUUi9qED9irSXp7
	GFE51moHqLdYwL5uaAvw3prRQJd9N7ldTBxvmpdNmWBw4ksrb1XjvAURFUeemE3uZwu7
	QDdXlxS6vSHz60FVml646eYS+/mefRBlyMOAt2hNPLg+wQhqH+BwfxNlVqzmQSko7NCx
	KycQ==
X-Gm-Message-State: APjAAAUyu4XU3eCJXGAbPoockgE6rqAb1k6X2wIgirMyFoYlFYrW+9NJ
	KuHNtICckpLFxYULLWMsvCCQGw==
X-Google-Smtp-Source: APXvYqzz21BWN0tFtdQ0K682G21GcSPN5lU0d/rg3w+M1AlUA+TYm4g7f5sQl4fwBy1ZuhvcGb/zyg==
X-Received: by 2002:a5d:4111:: with SMTP id l17mr27534017wrp.242.1556706250995;
	Wed, 01 May 2019 03:24:10 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id 10sm5962757wmd.23.2019.05.01.03.24.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 03:24:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B14C11FF87;
	Wed,  1 May 2019 11:24:09 +0100 (BST)
References: <20190428155451.15653-1-thuth@redhat.com>
	<20190428155451.15653-2-thuth@redhat.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
In-reply-to: <20190428155451.15653-2-thuth@redhat.com>
Date: Wed, 01 May 2019 11:24:09 +0100
Message-ID: <878svq79rq.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v2 1/8] tests/qemu-iotests: Fix output of
 qemu-io related tests
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Christophe Fergeau <cfergeau@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> One of the recent commits changed the way qemu-io prints out its
> errors and warnings - they are now prefixed with the program name.
> We've got to adapt the iotests accordingly to prevent that they
> are failing.
>
> Fixes: 99e98d7c9fc1a1639fad ("qemu-io: Use error_[gs]et_progname()")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/qemu-iotests/026.out | 168 ++++++++++++++++++-------------------
>  tests/qemu-iotests/060.out |   6 +-
>  tests/qemu-iotests/069.out |   2 +-
>  tests/qemu-iotests/070.out |   2 +-
>  tests/qemu-iotests/075.out |  14 ++--
>  tests/qemu-iotests/076.out |   6 +-
>  tests/qemu-iotests/078.out |  12 +--
>  tests/qemu-iotests/080.out |  40 ++++-----
>  tests/qemu-iotests/081.out |   2 +-
>  tests/qemu-iotests/088.out |  12 +--
>  tests/qemu-iotests/103.out |  14 ++--
>  tests/qemu-iotests/114.out |   2 +-
>  tests/qemu-iotests/116.out |  14 ++--
>  tests/qemu-iotests/131.out |   2 +-
>  tests/qemu-iotests/133.out |  30 +++----
>  tests/qemu-iotests/137.out |  28 +++----
>  tests/qemu-iotests/140.out |   2 +-
>  tests/qemu-iotests/143.out |   2 +-
>  tests/qemu-iotests/153.out |  30 +++----
>  tests/qemu-iotests/187.out |   6 +-
>  tests/qemu-iotests/188.out |   2 +-
>  tests/qemu-iotests/197.out |   2 +-
>  tests/qemu-iotests/205     |   2 +-
>  tests/qemu-iotests/215.out |   2 +-
>  tests/qemu-iotests/226.out |  16 ++--
>  tests/qemu-iotests/244.out |  10 +--
>  26 files changed, 214 insertions(+), 214 deletions(-)
>
> diff --git a/tests/qemu-iotests/026.out b/tests/qemu-iotests/026.out
> index dd10a82b51..fb89b8480c 100644
> --- a/tests/qemu-iotests/026.out
> +++ b/tests/qemu-iotests/026.out
> @@ -14,8 +14,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l1_update; errno: 5; imm: off; once: off; write
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>
>  1 leaked clusters were found on the image.
> @@ -23,8 +23,8 @@ This means waste of disk space, but no harm to data.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l1_update; errno: 5; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>
>  1 leaked clusters were found on the image.
> @@ -42,8 +42,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l1_update; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  1 leaked clusters were found on the image.
> @@ -51,8 +51,8 @@ This means waste of disk space, but no harm to data.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l1_update; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  1 leaked clusters were found on the image.
> @@ -134,8 +134,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l2_update; errno: 5; imm: off; once: off; write
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>
>  127 leaked clusters were found on the image.
> @@ -143,8 +143,8 @@ This means waste of disk space, but no harm to data.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l2_update; errno: 5; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>
>  127 leaked clusters were found on the image.
> @@ -162,8 +162,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l2_update; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  127 leaked clusters were found on the image.
> @@ -171,8 +171,8 @@ This means waste of disk space, but no harm to data.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l2_update; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  127 leaked clusters were found on the image.
> @@ -190,15 +190,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l2_alloc_write; errno: 5; imm: off; once: off; write
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l2_alloc_write; errno: 5; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>
>  1 leaked clusters were found on the image.
> @@ -216,15 +216,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l2_alloc_write; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l2_alloc_write; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  1 leaked clusters were found on the image.
> @@ -242,15 +242,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: write_aio; errno: 5; imm: off; once: off; write
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: write_aio; errno: 5; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -266,15 +266,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: write_aio; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: write_aio; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -290,15 +290,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_load; errno: 5; imm: off; once: off; write
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_load; errno: 5; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -314,15 +314,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_load; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_load; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -338,15 +338,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_update_part; errno: 5; imm: off; once: off; write
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_update_part; errno: 5; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -362,15 +362,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_update_part; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_update_part; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -386,15 +386,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc; errno: 5; imm: off; once: off; write
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc; errno: 5; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -410,15 +410,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -477,8 +477,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_hookup; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  55 leaked clusters were found on the image.
> @@ -486,8 +486,8 @@ This means waste of disk space, but no harm to data.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_hookup; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  251 leaked clusters were found on the image.
> @@ -505,15 +505,15 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_write; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_write; errno: 28; imm: off; once: off; write -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -529,8 +529,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_write_blocks; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  10 leaked clusters were found on the image.
> @@ -538,8 +538,8 @@ This means waste of disk space, but no harm to data.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_write_blocks; errno: 28; imm: off; once: off; writ=
e -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  23 leaked clusters were found on the image.
> @@ -557,8 +557,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_write_table; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  10 leaked clusters were found on the image.
> @@ -566,8 +566,8 @@ This means waste of disk space, but no harm to data.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_write_table; errno: 28; imm: off; once: off; write=
 -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  23 leaked clusters were found on the image.
> @@ -585,8 +585,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_switch_table; errno: 28; imm: off; once: off; write
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  10 leaked clusters were found on the image.
> @@ -594,8 +594,8 @@ This means waste of disk space, but no harm to data.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: refblock_alloc_switch_table; errno: 28; imm: off; once: off; writ=
e -b
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  23 leaked clusters were found on the image.
> @@ -631,8 +631,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l1_grow_write_table; errno: 5; imm: off; once: off
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -643,8 +643,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l1_grow_write_table; errno: 28; imm: off; once: off
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>  No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
> @@ -655,8 +655,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l1_grow_activate_table; errno: 5; imm: off; once: off
> -Failed to flush the L2 table cache: Input/output error
> -Failed to flush the refcount block cache: Input/output error
> +qemu-io: Failed to flush the L2 table cache: Input/output error
> +qemu-io: Failed to flush the refcount block cache: Input/output error
>  write failed: Input/output error
>
>  96 leaked clusters were found on the image.
> @@ -669,8 +669,8 @@ No errors were found on the image.
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824
>
>  Event: l1_grow_activate_table; errno: 28; imm: off; once: off
> -Failed to flush the L2 table cache: No space left on device
> -Failed to flush the refcount block cache: No space left on device
> +qemu-io: Failed to flush the L2 table cache: No space left on device
> +qemu-io: Failed to flush the refcount block cache: No space left on devi=
ce
>  write failed: No space left on device
>
>  96 leaked clusters were found on the image.
> diff --git a/tests/qemu-iotests/060.out b/tests/qemu-iotests/060.out
> index af623cfd86..ad1c18e903 100644
> --- a/tests/qemu-iotests/060.out
> +++ b/tests/qemu-iotests/060.out
> @@ -20,7 +20,7 @@ Format specific information:
>      lazy refcounts: false
>      refcount bits: 16
>      corrupt: true
> -can't open device TEST_DIR/t.IMGFMT: IMGFMT: Image is corrupt; cannot be=
 opened read/write
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: IMGFMT: Image is corrupt; =
cannot be opened read/write
>  no file open, try 'help open'
>  read 512/512 bytes at offset 0
>  512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> @@ -267,7 +267,7 @@ No errors were found on the image.
>  =3D=3D=3D Testing zero refcount table size =3D=3D=3D
>
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.IMGFMT: Image does not contain a reference =
count table
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: Image does not contain a r=
eference count table
>  ERROR cluster 0 refcount=3D0 reference=3D1
>  ERROR cluster 3 refcount=3D0 reference=3D1
>  Rebuilding refcount structure
> @@ -296,7 +296,7 @@ Can't get refcount for cluster 2: Input/output error
>  Can't get refcount for cluster 3: Input/output error
>  Rebuilding refcount structure
>  Repairing cluster 1 refcount=3D1 reference=3D0
> -can't open device TEST_DIR/t.IMGFMT: Could not repair dirty image: Input=
/output error
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not repair dirty ima=
ge: Input/output error
>  --- Repairing ---
>  Leaked cluster 1 refcount=3D1 reference=3D0
>  Repairing cluster 1 refcount=3D1 reference=3D0
> diff --git a/tests/qemu-iotests/069.out b/tests/qemu-iotests/069.out
> index f97585677b..c78e8c2b72 100644
> --- a/tests/qemu-iotests/069.out
> +++ b/tests/qemu-iotests/069.out
> @@ -4,5 +4,5 @@ QA output created by 069
>
>  Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D131072
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D131072 backing_file=
=3DTEST_DIR/t.IMGFMT.base
> -can't open device TEST_DIR/t.IMGFMT: Could not open backing file: Could =
not open 'TEST_DIR/t.IMGFMT.base': No such file or directory
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open backing fil=
e: Could not open 'TEST_DIR/t.IMGFMT.base': No such file or directory
>  *** done
> diff --git a/tests/qemu-iotests/070.out b/tests/qemu-iotests/070.out
> index c269d99483..c7c567344c 100644
> --- a/tests/qemu-iotests/070.out
> +++ b/tests/qemu-iotests/070.out
> @@ -1,7 +1,7 @@
>  QA output created by 070
>
>  =3D=3D=3D Verify open image read-only fails, due to dirty log =3D=3D=3D
> -can't open device TEST_DIR/iotest-dirtylog-10G-4M.vhdx: VHDX image file =
'TEST_DIR/iotest-dirtylog-10G-4M.vhdx' opened read-only, but contains a log=
 that needs to be replayed
> +qemu-io: can't open device TEST_DIR/iotest-dirtylog-10G-4M.vhdx: VHDX im=
age file 'TEST_DIR/iotest-dirtylog-10G-4M.vhdx' opened read-only, but conta=
ins a log that needs to be replayed
>  To replay the log, run:
>  qemu-img check -r all 'TEST_DIR/iotest-dirtylog-10G-4M.vhdx'
>  =3D=3D=3D Verify open image replays log  =3D=3D=3D
> diff --git a/tests/qemu-iotests/075.out b/tests/qemu-iotests/075.out
> index b234b758e0..4f3871d337 100644
> --- a/tests/qemu-iotests/075.out
> +++ b/tests/qemu-iotests/075.out
> @@ -9,23 +9,23 @@ read 512/512 bytes at offset 1048064
>  512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>
>  =3D=3D block_size must be a multiple of 512 =3D=3D
> -can't open device TEST_DIR/simple-pattern.cloop: block_size 513 must be =
a multiple of 512
> +qemu-io: can't open device TEST_DIR/simple-pattern.cloop: block_size 513=
 must be a multiple of 512
>
>  =3D=3D block_size cannot be zero =3D=3D
> -can't open device TEST_DIR/simple-pattern.cloop: block_size cannot be ze=
ro
> +qemu-io: can't open device TEST_DIR/simple-pattern.cloop: block_size can=
not be zero
>
>  =3D=3D huge block_size =3D=3D=3D
> -can't open device TEST_DIR/simple-pattern.cloop: block_size 4294966784 m=
ust be 64 MB or less
> +qemu-io: can't open device TEST_DIR/simple-pattern.cloop: block_size 429=
4966784 must be 64 MB or less
>
>  =3D=3D offsets_size overflow =3D=3D=3D
> -can't open device TEST_DIR/simple-pattern.cloop: n_blocks 4294967295 mus=
t be 536870911 or less
> +qemu-io: can't open device TEST_DIR/simple-pattern.cloop: n_blocks 42949=
67295 must be 536870911 or less
>
>  =3D=3D refuse images that require too many offsets =3D=3D=3D
> -can't open device TEST_DIR/simple-pattern.cloop: image requires too many=
 offsets, try increasing block size
> +qemu-io: can't open device TEST_DIR/simple-pattern.cloop: image requires=
 too many offsets, try increasing block size
>
>  =3D=3D refuse images with non-monotonically increasing offsets =3D=3D
> -can't open device TEST_DIR/simple-pattern.cloop: offsets not monotonical=
ly increasing at index 1, image file is corrupt
> +qemu-io: can't open device TEST_DIR/simple-pattern.cloop: offsets not mo=
notonically increasing at index 1, image file is corrupt
>
>  =3D=3D refuse images with invalid compressed block size =3D=3D
> -can't open device TEST_DIR/simple-pattern.cloop: invalid compressed bloc=
k size at index 1, image file is corrupt
> +qemu-io: can't open device TEST_DIR/simple-pattern.cloop: invalid compre=
ssed block size at index 1, image file is corrupt
>  *** done
> diff --git a/tests/qemu-iotests/076.out b/tests/qemu-iotests/076.out
> index 9c66c5fb46..2de8a710a5 100644
> --- a/tests/qemu-iotests/076.out
> +++ b/tests/qemu-iotests/076.out
> @@ -5,13 +5,13 @@ read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>
>  =3D=3D Negative catalog size =3D=3D
> -can't open device TEST_DIR/parallels-v1: Catalog too large
> +qemu-io: can't open device TEST_DIR/parallels-v1: Catalog too large
>
>  =3D=3D Overflow in catalog allocation =3D=3D
> -can't open device TEST_DIR/parallels-v1: Catalog too large
> +qemu-io: can't open device TEST_DIR/parallels-v1: Catalog too large
>
>  =3D=3D Zero sectors per track =3D=3D
> -can't open device TEST_DIR/parallels-v1: Invalid image: Zero sectors per=
 track
> +qemu-io: can't open device TEST_DIR/parallels-v1: Invalid image: Zero se=
ctors per track
>
>  =3D=3D Read from a valid v2 image =3D=3D
>  read 65536/65536 bytes at offset 0
> diff --git a/tests/qemu-iotests/078.out b/tests/qemu-iotests/078.out
> index c3d6aa4fe4..4a82e1779f 100644
> --- a/tests/qemu-iotests/078.out
> +++ b/tests/qemu-iotests/078.out
> @@ -5,18 +5,18 @@ read 512/512 bytes at offset 0
>  512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>
>  =3D=3D Negative catalog size =3D=3D
> -can't open device TEST_DIR/empty.bochs: Catalog size is too large
> +qemu-io: can't open device TEST_DIR/empty.bochs: Catalog size is too lar=
ge
>
>  =3D=3D Overflow for catalog size * sizeof(uint32_t) =3D=3D
> -can't open device TEST_DIR/empty.bochs: Catalog size is too large
> +qemu-io: can't open device TEST_DIR/empty.bochs: Catalog size is too lar=
ge
>
>  =3D=3D Too small catalog bitmap for image size =3D=3D
> -can't open device TEST_DIR/empty.bochs: Catalog size is too small for th=
is disk size
> -can't open device TEST_DIR/empty.bochs: Catalog size is too small for th=
is disk size
> +qemu-io: can't open device TEST_DIR/empty.bochs: Catalog size is too sma=
ll for this disk size
> +qemu-io: can't open device TEST_DIR/empty.bochs: Catalog size is too sma=
ll for this disk size
>
>  =3D=3D Negative extent size =3D=3D
> -can't open device TEST_DIR/empty.bochs: Extent size 2147483648 is too la=
rge
> +qemu-io: can't open device TEST_DIR/empty.bochs: Extent size 2147483648 =
is too large
>
>  =3D=3D Zero extent size =3D=3D
> -can't open device TEST_DIR/empty.bochs: Extent size must be at least 512
> +qemu-io: can't open device TEST_DIR/empty.bochs: Extent size must be at =
least 512
>  *** done
> diff --git a/tests/qemu-iotests/080.out b/tests/qemu-iotests/080.out
> index 281c7e0d1d..45ab01db8e 100644
> --- a/tests/qemu-iotests/080.out
> +++ b/tests/qemu-iotests/080.out
> @@ -2,34 +2,34 @@ QA output created by 080
>
>  =3D=3D Huge header size =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: qcow2 header exceeds cluster size
> -can't open device TEST_DIR/t.qcow2: qcow2 header exceeds cluster size
> +qemu-io: can't open device TEST_DIR/t.qcow2: qcow2 header exceeds cluste=
r size
> +qemu-io: can't open device TEST_DIR/t.qcow2: qcow2 header exceeds cluste=
r size
>
>  =3D=3D Huge unknown header extension =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: Invalid backing file offset
> -can't open device TEST_DIR/t.qcow2: Header extension too large
> -can't open device TEST_DIR/t.qcow2: Header extension too large
> +qemu-io: can't open device TEST_DIR/t.qcow2: Invalid backing file offset
> +qemu-io: can't open device TEST_DIR/t.qcow2: Header extension too large
> +qemu-io: can't open device TEST_DIR/t.qcow2: Header extension too large
>
>  =3D=3D Huge refcount table size =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: Reference count table too large
> -can't open device TEST_DIR/t.qcow2: Reference count table too large
> +qemu-io: can't open device TEST_DIR/t.qcow2: Reference count table too l=
arge
> +qemu-io: can't open device TEST_DIR/t.qcow2: Reference count table too l=
arge
>
>  =3D=3D Misaligned refcount table =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: Reference count table offset invalid
> +qemu-io: can't open device TEST_DIR/t.qcow2: Reference count table offse=
t invalid
>
>  =3D=3D Huge refcount offset =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: Reference count table offset invalid
> +qemu-io: can't open device TEST_DIR/t.qcow2: Reference count table offse=
t invalid
>
>  =3D=3D Invalid snapshot table =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: Snapshot table too large
> -can't open device TEST_DIR/t.qcow2: Snapshot table too large
> -can't open device TEST_DIR/t.qcow2: Snapshot table offset invalid
> -can't open device TEST_DIR/t.qcow2: Snapshot table offset invalid
> +qemu-io: can't open device TEST_DIR/t.qcow2: Snapshot table too large
> +qemu-io: can't open device TEST_DIR/t.qcow2: Snapshot table too large
> +qemu-io: can't open device TEST_DIR/t.qcow2: Snapshot table offset inval=
id
> +qemu-io: can't open device TEST_DIR/t.qcow2: Snapshot table offset inval=
id
>
>  =3D=3D Hitting snapshot table size limit =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> @@ -39,10 +39,10 @@ read 512/512 bytes at offset 0
>
>  =3D=3D Invalid L1 table =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: Active L1 table too large
> -can't open device TEST_DIR/t.qcow2: Active L1 table too large
> -can't open device TEST_DIR/t.qcow2: Active L1 table offset invalid
> -can't open device TEST_DIR/t.qcow2: Active L1 table offset invalid
> +qemu-io: can't open device TEST_DIR/t.qcow2: Active L1 table too large
> +qemu-io: can't open device TEST_DIR/t.qcow2: Active L1 table too large
> +qemu-io: can't open device TEST_DIR/t.qcow2: Active L1 table offset inva=
lid
> +qemu-io: can't open device TEST_DIR/t.qcow2: Active L1 table offset inva=
lid
>
>  =3D=3D Invalid L1 table (with internal snapshot in the image) =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> @@ -50,7 +50,7 @@ qemu-img: Could not open 'TEST_DIR/t.IMGFMT': L1 table =
is too small
>
>  =3D=3D Invalid backing file size =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: Backing file name too long
> +qemu-io: can't open device TEST_DIR/t.qcow2: Backing file name too long
>
>  =3D=3D Invalid L2 entry (huge physical offset) =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> @@ -66,7 +66,7 @@ wrote 512/512 bytes at offset 0
>  qemu-img: Failed to load snapshot: Snapshot L1 table offset invalid
>  qemu-img: Snapshot L1 table offset invalid
>  qemu-img: Failed to turn zero into data clusters: Invalid argument
> -Failed to flush the refcount block cache: Invalid argument
> +qemu-io: Failed to flush the refcount block cache: Invalid argument
>  write failed: Invalid argument
>  qemu-img: Snapshot L1 table offset invalid
>  qemu-img: Could not apply snapshot 'test': Failed to load snapshot: Inva=
lid argument
> @@ -89,7 +89,7 @@ wrote 512/512 bytes at offset 0
>  qemu-img: Failed to load snapshot: Snapshot L1 table too large
>  qemu-img: Snapshot L1 table too large
>  qemu-img: Failed to turn zero into data clusters: File too large
> -Failed to flush the refcount block cache: File too large
> +qemu-io: Failed to flush the refcount block cache: File too large
>  write failed: File too large
>  qemu-img: Snapshot L1 table too large
>  qemu-img: Could not apply snapshot 'test': Failed to load snapshot: File=
 too large
> diff --git a/tests/qemu-iotests/081.out b/tests/qemu-iotests/081.out
> index 8ec1783ffe..04091b64e5 100644
> --- a/tests/qemu-iotests/081.out
> +++ b/tests/qemu-iotests/081.out
> @@ -70,7 +70,7 @@ read 10485760/10485760 bytes at offset 0
>  10 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>
>  =3D=3D checking the blkverify mode with invalid settings =3D=3D
> -can't open: blkverify=3Don can only be set if there are exactly two file=
s and vote-threshold is 2
> +qemu-io: can't open: blkverify=3Don can only be set if there are exactly=
 two files and vote-threshold is 2
>
>  =3D=3D dynamically adding a child to a quorum =3D=3D
>  Testing:
> diff --git a/tests/qemu-iotests/088.out b/tests/qemu-iotests/088.out
> index 1f6bcf0abc..814be7181d 100644
> --- a/tests/qemu-iotests/088.out
> +++ b/tests/qemu-iotests/088.out
> @@ -2,10 +2,10 @@ QA output created by 088
>
>  =3D=3D Invalid block size =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.vpc: Invalid block size 0
> -can't open device TEST_DIR/t.vpc: Invalid block size 0
> -can't open device TEST_DIR/t.vpc: Invalid block size 128
> -can't open device TEST_DIR/t.vpc: Invalid block size 128
> -can't open device TEST_DIR/t.vpc: Invalid block size 305419896
> -can't open device TEST_DIR/t.vpc: Invalid block size 305419896
> +qemu-io: can't open device TEST_DIR/t.vpc: Invalid block size 0
> +qemu-io: can't open device TEST_DIR/t.vpc: Invalid block size 0
> +qemu-io: can't open device TEST_DIR/t.vpc: Invalid block size 128
> +qemu-io: can't open device TEST_DIR/t.vpc: Invalid block size 128
> +qemu-io: can't open device TEST_DIR/t.vpc: Invalid block size 305419896
> +qemu-io: can't open device TEST_DIR/t.vpc: Invalid block size 305419896
>  *** done
> diff --git a/tests/qemu-iotests/103.out b/tests/qemu-iotests/103.out
> index bd9eec3250..16704cf499 100644
> --- a/tests/qemu-iotests/103.out
> +++ b/tests/qemu-iotests/103.out
> @@ -5,13 +5,13 @@ wrote 65536/65536 bytes at offset 0
>
>  =3D=3D=3D Testing invalid option combinations =3D=3D=3D
>
> -can't open device TEST_DIR/t.IMGFMT: cache-size, l2-cache-size and refco=
unt-cache-size may not be set at the same time
> -can't open device TEST_DIR/t.IMGFMT: l2-cache-size may not exceed cache-=
size
> -can't open device TEST_DIR/t.IMGFMT: refcount-cache-size may not exceed =
cache-size
> -can't open device TEST_DIR/t.IMGFMT: cache-size, l2-cache-size and refco=
unt-cache-size may not be set at the same time
> -can't open device TEST_DIR/t.IMGFMT: L2 cache entry size must be a power=
 of two between 512 and the cluster size (65536)
> -can't open device TEST_DIR/t.IMGFMT: L2 cache entry size must be a power=
 of two between 512 and the cluster size (65536)
> -can't open device TEST_DIR/t.IMGFMT: L2 cache entry size must be a power=
 of two between 512 and the cluster size (65536)
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: cache-size, l2-cache-size =
and refcount-cache-size may not be set at the same time
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: l2-cache-size may not exce=
ed cache-size
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: refcount-cache-size may no=
t exceed cache-size
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: cache-size, l2-cache-size =
and refcount-cache-size may not be set at the same time
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: L2 cache entry size must b=
e a power of two between 512 and the cluster size (65536)
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: L2 cache entry size must b=
e a power of two between 512 and the cluster size (65536)
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: L2 cache entry size must b=
e a power of two between 512 and the cluster size (65536)
>
>  =3D=3D=3D Testing valid option combinations =3D=3D=3D
>
> diff --git a/tests/qemu-iotests/114.out b/tests/qemu-iotests/114.out
> index 1a47a526b9..22dc66c633 100644
> --- a/tests/qemu-iotests/114.out
> +++ b/tests/qemu-iotests/114.out
> @@ -7,7 +7,7 @@ virtual size: 64M (67108864 bytes)
>  cluster_size: 65536
>  backing file: TEST_DIR/t.IMGFMT.base
>  backing file format: foo
> -can't open device TEST_DIR/t.qcow2: Could not open backing file: Unknown=
 driver 'foo'
> +qemu-io: can't open device TEST_DIR/t.qcow2: Could not open backing file=
: Unknown driver 'foo'
>  no file open, try 'help open'
>  read 4096/4096 bytes at offset 0
>  4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> diff --git a/tests/qemu-iotests/116.out b/tests/qemu-iotests/116.out
> index 24bee57783..49f9a261a0 100644
> --- a/tests/qemu-iotests/116.out
> +++ b/tests/qemu-iotests/116.out
> @@ -2,29 +2,29 @@ QA output created by 116
>
>  =3D=3D truncated header cluster =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> -can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Inval=
id argument
> +qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qe=
d': Invalid argument
>
>  =3D=3D invalid header magic =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> -can't open device TEST_DIR/t.qed: Image not in QED format
> +qemu-io: can't open device TEST_DIR/t.qed: Image not in QED format
>
>  =3D=3D invalid cluster size =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> -can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Inval=
id argument
> +qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qe=
d': Invalid argument
>
>  =3D=3D invalid table size =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> -can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Inval=
id argument
> +qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qe=
d': Invalid argument
>
>  =3D=3D invalid header size =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> -can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Inval=
id argument
> +qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qe=
d': Invalid argument
>
>  =3D=3D invalid L1 table offset =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> -can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Inval=
id argument
> +qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qe=
d': Invalid argument
>
>  =3D=3D invalid image size =3D=3D
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> -can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Inval=
id argument
> +qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qe=
d': Invalid argument
>  *** done
> diff --git a/tests/qemu-iotests/131.out b/tests/qemu-iotests/131.out
> index 27c2c5389b..70da03dee5 100644
> --- a/tests/qemu-iotests/131.out
> +++ b/tests/qemu-iotests/131.out
> @@ -22,7 +22,7 @@ read 32768/32768 bytes at offset 163840
>  read 32768/32768 bytes at offset 0
>  32 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  =3D=3D Corrupt image =3D=3D
> -can't open device TEST_DIR/t.parallels: parallels: Image was not closed =
correctly; cannot be opened read/write
> +qemu-io: can't open device TEST_DIR/t.parallels: parallels: Image was no=
t closed correctly; cannot be opened read/write
>  ERROR image was not closed correctly
>
>  1 errors were found on the image.
> diff --git a/tests/qemu-iotests/133.out b/tests/qemu-iotests/133.out
> index 414c7fa27f..1491ef45a9 100644
> --- a/tests/qemu-iotests/133.out
> +++ b/tests/qemu-iotests/133.out
> @@ -4,18 +4,18 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D671=
08864 backing_file=3DTEST_DIR/t
>
>  =3D=3D=3D Check that node-name can't be changed =3D=3D=3D
>
> -Cannot change the option 'node-name'
> -Cannot change the option 'node-name'
> -Cannot change the option 'node-name'
> +qemu-io: Cannot change the option 'node-name'
> +qemu-io: Cannot change the option 'node-name'
> +qemu-io: Cannot change the option 'node-name'
>
>  =3D=3D=3D Check that unchanged node-name is okay =3D=3D=3D
>
>
>  =3D=3D=3D Check that driver can't be changed =3D=3D=3D
>
> -Cannot change the option 'driver'
> -Cannot change the option 'driver'
> -Cannot change the option 'driver'
> +qemu-io: Cannot change the option 'driver'
> +qemu-io: Cannot change the option 'driver'
> +qemu-io: Cannot change the option 'driver'
>
>  =3D=3D=3D Check that unchanged driver is okay =3D=3D=3D
>
> @@ -27,16 +27,16 @@ format name: null-co
>
>  =3D=3D=3D Check that mixing -c/-r/-w and their corresponding options is =
forbidden =3D=3D=3D
>
> -Cannot set both -r/-w and 'read-only'
> -Cannot set both -r/-w and 'read-only'
> -Cannot set both -c and the cache options
> -Cannot set both -c and the cache options
> -Cannot set both -c and the cache options
> +qemu-io: Cannot set both -r/-w and 'read-only'
> +qemu-io: Cannot set both -r/-w and 'read-only'
> +qemu-io: Cannot set both -c and the cache options
> +qemu-io: Cannot set both -c and the cache options
> +qemu-io: Cannot set both -c and the cache options
>
>  =3D=3D=3D Check that invalid options are handled correctly =3D=3D=3D
>
> -Parameter 'read-only' expects 'on' or 'off'
> -Parameter 'cache.no-flush' expects 'on' or 'off'
> -Parameter 'cache.direct' expects 'on' or 'off'
> -Parameter 'auto-read-only' expects 'on' or 'off'
> +qemu-io: Parameter 'read-only' expects 'on' or 'off'
> +qemu-io: Parameter 'cache.no-flush' expects 'on' or 'off'
> +qemu-io: Parameter 'cache.direct' expects 'on' or 'off'
> +qemu-io: Parameter 'auto-read-only' expects 'on' or 'off'
>  *** done
> diff --git a/tests/qemu-iotests/137.out b/tests/qemu-iotests/137.out
> index 2c080b72f3..22d59df40c 100644
> --- a/tests/qemu-iotests/137.out
> +++ b/tests/qemu-iotests/137.out
> @@ -15,24 +15,24 @@ read 33554432/33554432 bytes at offset 0
>
>  =3D=3D=3D Try setting some invalid values =3D=3D=3D
>
> -Parameter 'lazy-refcounts' expects 'on' or 'off'
> -cache-size, l2-cache-size and refcount-cache-size may not be set at the =
same time
> -l2-cache-size may not exceed cache-size
> -refcount-cache-size may not exceed cache-size
> -L2 cache entry size must be a power of two between 512 and the cluster s=
ize (65536)
> -L2 cache entry size must be a power of two between 512 and the cluster s=
ize (65536)
> -Refcount cache size too big
> -Conflicting values for qcow2 options 'overlap-check' ('constant') and 'o=
verlap-check.template' ('all')
> -Unsupported value 'blubb' for qcow2 option 'overlap-check'. Allowed are =
any of the following: none, constant, cached, all
> -Unsupported value 'blubb' for qcow2 option 'overlap-check'. Allowed are =
any of the following: none, constant, cached, all
> -Cache clean interval too big
> +qemu-io: Parameter 'lazy-refcounts' expects 'on' or 'off'
> +qemu-io: cache-size, l2-cache-size and refcount-cache-size may not be se=
t at the same time
> +qemu-io: l2-cache-size may not exceed cache-size
> +qemu-io: refcount-cache-size may not exceed cache-size
> +qemu-io: L2 cache entry size must be a power of two between 512 and the =
cluster size (65536)
> +qemu-io: L2 cache entry size must be a power of two between 512 and the =
cluster size (65536)
> +qemu-io: Refcount cache size too big
> +qemu-io: Conflicting values for qcow2 options 'overlap-check' ('constant=
') and 'overlap-check.template' ('all')
> +qemu-io: Unsupported value 'blubb' for qcow2 option 'overlap-check'. All=
owed are any of the following: none, constant, cached, all
> +qemu-io: Unsupported value 'blubb' for qcow2 option 'overlap-check'. All=
owed are any of the following: none, constant, cached, all
> +qemu-io: Cache clean interval too big
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D36028797018963968
> -L2 cache size too big
> +qemu-io: L2 cache size too big
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
>
>  =3D=3D=3D Test transaction semantics =3D=3D=3D
>
> -Unsupported value 'blubb' for qcow2 option 'overlap-check'. Allowed are =
any of the following: none, constant, cached, all
> +qemu-io: Unsupported value 'blubb' for qcow2 option 'overlap-check'. All=
owed are any of the following: none, constant, cached, all
>  wrote 512/512 bytes at offset 0
>  512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  ./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" =3D=3D "y=
" ]; then
> @@ -44,7 +44,7 @@ incompatible_features     0x0
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
>  wrote 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -Parameter 'lazy-refcounts' expects 'on' or 'off'
> +qemu-io: Parameter 'lazy-refcounts' expects 'on' or 'off'
>  qcow2: Marking image as corrupt: Preventing invalid write on metadata (o=
verlaps with qcow2_header); further corruption events will be suppressed
>  write failed: Input/output error
>  *** done
> diff --git a/tests/qemu-iotests/140.out b/tests/qemu-iotests/140.out
> index 704adcef40..67fe44a3e3 100644
> --- a/tests/qemu-iotests/140.out
> +++ b/tests/qemu-iotests/140.out
> @@ -8,7 +8,7 @@ wrote 65536/65536 bytes at offset 0
>  read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  {"return": {}}
> -can't open device nbd+unix:///drv?socket=3DTEST_DIR/nbd: Requested expor=
t not available
> +qemu-io: can't open device nbd+unix:///drv?socket=3DTEST_DIR/nbd: Reques=
ted export not available
>  server reported: export 'drv' not present
>  {"return": {}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> diff --git a/tests/qemu-iotests/143.out b/tests/qemu-iotests/143.out
> index 3e55fcd0ac..ee71b5aa42 100644
> --- a/tests/qemu-iotests/143.out
> +++ b/tests/qemu-iotests/143.out
> @@ -1,7 +1,7 @@
>  QA output created by 143
>  {"return": {}}
>  {"return": {}}
> -can't open device nbd+unix:///no_such_export?socket=3DTEST_DIR/nbd: Requ=
ested export not available
> +qemu-io: can't open device nbd+unix:///no_such_export?socket=3DTEST_DIR/=
nbd: Requested export not available
>  server reported: export 'no_such_export' not present
>  {"return": {}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> diff --git a/tests/qemu-iotests/153.out b/tests/qemu-iotests/153.out
> index 9747ce3c41..021c1cb899 100644
> --- a/tests/qemu-iotests/153.out
> +++ b/tests/qemu-iotests/153.out
> @@ -23,20 +23,20 @@ Is another process using the image [TEST_DIR/t.qcow2]?
>  =3D=3D Running utility commands  =3D=3D
>
>  _qemu_io_wrapper -c read 0 512 TEST_DIR/t.qcow2
> -can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
> +qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
>  Is another process using the image [TEST_DIR/t.qcow2]?
>
>  _qemu_io_wrapper -r -c read 0 512 TEST_DIR/t.qcow2
> -can't open device TEST_DIR/t.qcow2: Failed to get shared "write" lock
> +qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get shared "write=
" lock
>  Is another process using the image [TEST_DIR/t.qcow2]?
>
>  _qemu_io_wrapper -c open  TEST_DIR/t.qcow2 -c read 0 512
> -can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
> +qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
>  Is another process using the image [TEST_DIR/t.qcow2]?
>  no file open, try 'help open'
>
>  _qemu_io_wrapper -c open -r  TEST_DIR/t.qcow2 -c read 0 512
> -can't open device TEST_DIR/t.qcow2: Failed to get shared "write" lock
> +qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get shared "write=
" lock
>  Is another process using the image [TEST_DIR/t.qcow2]?
>  no file open, try 'help open'
>
> @@ -100,12 +100,12 @@ file format: IMGFMT
>  =3D=3D Running utility commands -U =3D=3D
>
>  _qemu_io_wrapper -U -c read 0 512 TEST_DIR/t.qcow2
> -can't open device TEST_DIR/t.qcow2: force-share=3Don can only be used wi=
th read-only images
> +qemu-io: can't open device TEST_DIR/t.qcow2: force-share=3Don can only b=
e used with read-only images
>
>  _qemu_io_wrapper -U -r -c read 0 512 TEST_DIR/t.qcow2
>
>  _qemu_io_wrapper -c open -U TEST_DIR/t.qcow2 -c read 0 512
> -can't open device TEST_DIR/t.qcow2: force-share=3Don can only be used wi=
th read-only images
> +qemu-io: can't open device TEST_DIR/t.qcow2: force-share=3Don can only b=
e used with read-only images
>  no file open, try 'help open'
>
>  _qemu_io_wrapper -c open -r -U TEST_DIR/t.qcow2 -c read 0 512
> @@ -166,13 +166,13 @@ Is another process using the image [TEST_DIR/t.qcow=
2]?
>  =3D=3D Running utility commands  =3D=3D
>
>  _qemu_io_wrapper -c read 0 512 TEST_DIR/t.qcow2
> -can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
> +qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
>  Is another process using the image [TEST_DIR/t.qcow2]?
>
>  _qemu_io_wrapper -r -c read 0 512 TEST_DIR/t.qcow2
>
>  _qemu_io_wrapper -c open  TEST_DIR/t.qcow2 -c read 0 512
> -can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
> +qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
>  Is another process using the image [TEST_DIR/t.qcow2]?
>  no file open, try 'help open'
>
> @@ -222,12 +222,12 @@ file format: IMGFMT
>  =3D=3D Running utility commands -U =3D=3D
>
>  _qemu_io_wrapper -U -c read 0 512 TEST_DIR/t.qcow2
> -can't open device TEST_DIR/t.qcow2: force-share=3Don can only be used wi=
th read-only images
> +qemu-io: can't open device TEST_DIR/t.qcow2: force-share=3Don can only b=
e used with read-only images
>
>  _qemu_io_wrapper -U -r -c read 0 512 TEST_DIR/t.qcow2
>
>  _qemu_io_wrapper -c open -U TEST_DIR/t.qcow2 -c read 0 512
> -can't open device TEST_DIR/t.qcow2: force-share=3Don can only be used wi=
th read-only images
> +qemu-io: can't open device TEST_DIR/t.qcow2: force-share=3Don can only b=
e used with read-only images
>  no file open, try 'help open'
>
>  _qemu_io_wrapper -c open -r -U TEST_DIR/t.qcow2 -c read 0 512
> @@ -325,12 +325,12 @@ file format: IMGFMT
>  =3D=3D Running utility commands -U =3D=3D
>
>  _qemu_io_wrapper -U -c read 0 512 TEST_DIR/t.qcow2
> -can't open device TEST_DIR/t.qcow2: force-share=3Don can only be used wi=
th read-only images
> +qemu-io: can't open device TEST_DIR/t.qcow2: force-share=3Don can only b=
e used with read-only images
>
>  _qemu_io_wrapper -U -r -c read 0 512 TEST_DIR/t.qcow2
>
>  _qemu_io_wrapper -c open -U TEST_DIR/t.qcow2 -c read 0 512
> -can't open device TEST_DIR/t.qcow2: force-share=3Don can only be used wi=
th read-only images
> +qemu-io: can't open device TEST_DIR/t.qcow2: force-share=3Don can only b=
e used with read-only images
>  no file open, try 'help open'
>
>  _qemu_io_wrapper -c open -r -U TEST_DIR/t.qcow2 -c read 0 512
> @@ -420,7 +420,7 @@ Adding drive
>  {"return": "OKrn"}
>
>  _qemu_io_wrapper TEST_DIR/t.qcow2 -c write 0 512
> -can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
> +qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
>  Is another process using the image [TEST_DIR/t.qcow2]?
>  Creating overlay with qemu-img when the guest is running should be allow=
ed
>
> @@ -437,7 +437,7 @@ _qemu_img_wrapper info TEST_DIR/t.qcow2
>  {"return": ""}
>
>  _qemu_io_wrapper TEST_DIR/t.qcow2 -c write 0 512
> -can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
> +qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
>  Is another process using the image [TEST_DIR/t.qcow2]?
>  Closing the other
>  {"return": ""}
> @@ -458,5 +458,5 @@ qemu-img: --force-share/-U conflicts with image optio=
ns
>  No conflict:
>
>  Conflict:
> --U conflicts with image options
> +qemu-io: -U conflicts with image options
>  *** done
> diff --git a/tests/qemu-iotests/187.out b/tests/qemu-iotests/187.out
> index 30b987f71f..86203d8abc 100644
> --- a/tests/qemu-iotests/187.out
> +++ b/tests/qemu-iotests/187.out
> @@ -3,16 +3,16 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D671=
08864
>
>  Start from read-only
>
> -Block node is read-only
> +qemu-io: Block node is read-only
>  wrote 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -Block node is read-only
> +qemu-io: Block node is read-only
>
>  Start from read-write
>
>  wrote 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -Block node is read-only
> +qemu-io: Block node is read-only
>  wrote 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  *** done
> diff --git a/tests/qemu-iotests/188.out b/tests/qemu-iotests/188.out
> index 8af24e5d8b..97b1402671 100644
> --- a/tests/qemu-iotests/188.out
> +++ b/tests/qemu-iotests/188.out
> @@ -14,5 +14,5 @@ read 16777216/16777216 bytes at offset 0
>  16 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>
>  =3D=3D verify open failure with wrong password =3D=3D
> -can't open: Invalid password, cannot unlock any keyslot
> +qemu-io: can't open: Invalid password, cannot unlock any keyslot
>  *** done
> diff --git a/tests/qemu-iotests/197.out b/tests/qemu-iotests/197.out
> index 8febda5dea..7ca46be6e4 100644
> --- a/tests/qemu-iotests/197.out
> +++ b/tests/qemu-iotests/197.out
> @@ -16,7 +16,7 @@ read 2147483136/2147483136 bytes at offset 1024
>  2 GiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  read 1024/1024 bytes at offset 3221226496
>  1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -can't open device TEST_DIR/t.wrap.qcow2: Can't use copy-on-read on read-=
only device
> +qemu-io: can't open device TEST_DIR/t.wrap.qcow2: Can't use copy-on-read=
 on read-only device
>  2 GiB (0x80010000) bytes     allocated at offset 0 bytes (0x0)
>  1023.938 MiB (0x3fff0000) bytes not allocated at offset 2 GiB (0x8001000=
0)
>  64 KiB (0x10000) bytes     allocated at offset 3 GiB (0xc0000000)
> diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
> index 31b2f5707a..69f2c1d392 100755
> --- a/tests/qemu-iotests/205
> +++ b/tests/qemu-iotests/205
> @@ -78,7 +78,7 @@ class TestNbdServerRemove(iotests.QMPTestCase):
>
>      def assertConnectFailed(self, qemu_io_output):
>          self.assertEqual(filter_qemu_io(qemu_io_output).strip(),
> -                         "can't open device " + nbd_uri +
> +                         "qemu-io: can't open device " + nbd_uri +
>                           ": Requested export not available\n"
>                           "server reported: export 'exp' not present")
>
> diff --git a/tests/qemu-iotests/215.out b/tests/qemu-iotests/215.out
> index 70b0f5fb19..5a2fe40d03 100644
> --- a/tests/qemu-iotests/215.out
> +++ b/tests/qemu-iotests/215.out
> @@ -16,7 +16,7 @@ read 2147483136/2147483136 bytes at offset 1024
>  2 GiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  read 1024/1024 bytes at offset 3221226496
>  1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -can't open device TEST_DIR/t.wrap.qcow2: Block node is read-only
> +qemu-io: can't open device TEST_DIR/t.wrap.qcow2: Block node is read-only
>  2 GiB (0x80010000) bytes     allocated at offset 0 bytes (0x0)
>  1023.938 MiB (0x3fff0000) bytes not allocated at offset 2 GiB (0x8001000=
0)
>  64 KiB (0x10000) bytes     allocated at offset 3 GiB (0xc0000000)
> diff --git a/tests/qemu-iotests/226.out b/tests/qemu-iotests/226.out
> index 8c0d060ffc..42be973ff2 100644
> --- a/tests/qemu-iotests/226.out
> +++ b/tests/qemu-iotests/226.out
> @@ -3,24 +3,24 @@ QA output created by 226
>  =3D=3D=3D Testing with driver:file =3D=3D=3D
>
>  =3D=3D Testing RO =3D=3D
> -can't open: A regular file was expected by the 'file' driver, but someth=
ing else was given
> -warning: Opening a character device as a file using the 'file' driver is=
 deprecated
> +qemu-io: can't open: A regular file was expected by the 'file' driver, b=
ut something else was given
> +qemu-io: warning: Opening a character device as a file using the 'file' =
driver is deprecated
>  =3D=3D Testing RW =3D=3D
> -can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
> -warning: Opening a character device as a file using the 'file' driver is=
 deprecated
> +qemu-io: can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
> +qemu-io: warning: Opening a character device as a file using the 'file' =
driver is deprecated
>
>  =3D=3D=3D Testing with driver:host_device =3D=3D=3D
>
>  =3D=3D Testing RO =3D=3D
> -can't open: 'host_device' driver expects either a character or block dev=
ice
> +qemu-io: can't open: 'host_device' driver expects either a character or =
block device
>  =3D=3D Testing RW =3D=3D
> -can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
> +qemu-io: can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
>
>  =3D=3D=3D Testing with driver:host_cdrom =3D=3D=3D
>
>  =3D=3D Testing RO =3D=3D
> -can't open: 'host_cdrom' driver expects either a character or block devi=
ce
> +qemu-io: can't open: 'host_cdrom' driver expects either a character or b=
lock device
>  =3D=3D Testing RW =3D=3D
> -can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
> +qemu-io: can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
>
>  *** done
> diff --git a/tests/qemu-iotests/244.out b/tests/qemu-iotests/244.out
> index 98e5946976..6a3d0067cc 100644
> --- a/tests/qemu-iotests/244.out
> +++ b/tests/qemu-iotests/244.out
> @@ -9,22 +9,22 @@ read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -can't open device TEST_DIR/t.qcow2: Could not open 'inexistent': No such=
 file or directory
> +qemu-io: can't open device TEST_DIR/t.qcow2: Could not open 'inexistent'=
: No such file or directory
>  no file open, try 'help open'
>
>  Data file required, but without data file name in the image:
> -can't open device TEST_DIR/t.qcow2: 'data-file' is required for this ima=
ge
> +qemu-io: can't open device TEST_DIR/t.qcow2: 'data-file' is required for=
 this image
>  no file open, try 'help open'
>  read 65536/65536 bytes at offset 0
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -can't open device TEST_DIR/t.qcow2: Could not open 'inexistent': No such=
 file or directory
> +qemu-io: can't open device TEST_DIR/t.qcow2: Could not open 'inexistent'=
: No such file or directory
>  no file open, try 'help open'
>
>  Setting data-file for an image with internal data:
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -can't open device TEST_DIR/t.qcow2: 'data-file' can only be set for imag=
es with an external data file
> +qemu-io: can't open device TEST_DIR/t.qcow2: 'data-file' can only be set=
 for images with an external data file
>  no file open, try 'help open'
> -can't open device TEST_DIR/t.qcow2: Could not open 'inexistent': No such=
 file or directory
> +qemu-io: can't open device TEST_DIR/t.qcow2: Could not open 'inexistent'=
: No such file or directory
>  no file open, try 'help open'
>
>  =3D=3D=3D Conflicting features =3D=3D=3D


--
Alex Benn=C3=A9e

