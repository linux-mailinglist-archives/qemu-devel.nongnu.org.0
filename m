Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05589B75AA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 11:05:53 +0200 (CEST)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAsNr-0003o1-BD
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 05:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iAsDp-0002Ss-Md
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iAsDn-00063p-Pt
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:55:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33539)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iAsDl-00061D-Q3
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:55:27 -0400
Received: by mail-wr1-x429.google.com with SMTP id b9so2237229wrs.0
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=moOYIlwVv2orNBoRZOLsxJ1gRHB+D+sr3AXlvcuI33M=;
 b=GH8kLnjs3SMJAj8lfDNLf49b0KX8hGUhblzK4E8hSBYvQ9RnWkv758Re4iYM8UgEQT
 3OcO6vfOWXa3e55zgsCw+fBrcrM6wXS+KuJj97ST505WPuzXadwzCeQCP5JqZF9y9ujG
 9erKnQ7xZx7c7ivTkjVLk72GG0Zo5dpuAGrPemoeGTA7mGrKxBq1EK3eAw4S+ugLUxeH
 AJWrNt4XFBhQcSrZ16h3BXGWfjgi4XoLg68xuf3WpbbU38C1D1rHPw8uxtJQO1Hqli9+
 0lCh+zzCl9RB2cdkz/sMfmRGCDhRO8Y7FGIFnSsCIG603IfUSYsyoj5rCDYcl3kziB6d
 BdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=moOYIlwVv2orNBoRZOLsxJ1gRHB+D+sr3AXlvcuI33M=;
 b=Wavvn1xQodjJatX/pFQOWae/yO4xWQyf7zF15O7KZZMz4IHz+7X41PUNH6eLNd2dil
 C8RU7/NWtdd6pqKPsZi8KhDuJH3Q3O5kuDdNkjXWbVMFGrrxMO3Kv7Bs4lR/ce+b0tGM
 JwTaVzGppdqX+80xPftx8uCh5YQj0cDyMUXci38lM9zYYYFnpANDpaWVhOAnpi+RKKeP
 XVbjFLEDF+fEdd8GtOlqY0KjW13uGOiU9gage8e5GRziRsVCvDImQNIhXhel0KRxQF+o
 k5V30U/x06k0sQP6SMa1jlxSXJ/O7xDqlrEpYqyhUxxXn1dOGK0XMkO/VKmtxwvn/yzF
 P5tA==
X-Gm-Message-State: APjAAAVVyizfhRMW+C2/tjbI0yZsVT3bwV40Adf2cSRPsLwmRA8OKHvB
 khVCn23/pU/gcG0YLn/eFeypOqbPwxw=
X-Google-Smtp-Source: APXvYqx7u+wJ03S8ycFL/IDWI3hFvWncLiVVyXfvmpDvFevpGnxsRpZnChwKojbfF4ITMxfQP5XMPg==
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr5759543wrs.189.1568883321913; 
 Thu, 19 Sep 2019 01:55:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s9sm6915869wme.36.2019.09.19.01.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 01:55:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C9B31FF87;
 Thu, 19 Sep 2019 09:55:20 +0100 (BST)
References: <db0d4563-2cc0-fe20-f9ee-3c73766e489f@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
In-reply-to: <db0d4563-2cc0-fe20-f9ee-3c73766e489f@redhat.com>
Date: Thu, 19 Sep 2019 09:55:20 +0100
Message-ID: <87tv98zmvb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: Re: [Qemu-devel] Docker Tests
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Hi, I'm having a regular trainwreck here w/ the Docker test suite and I
> have a few questions;
>
> 1. Which tests should I expect to work by default? for instance,
> make-debug doesn't but I think that might be normal. Is that the only
> one?

test-build is the only one that just builds. As a lot of the docker
images are cross compilers you generally can't run tests with them which
limits the use of tests that run make check.

> 2. Should all tests work for all targets?

No for reasons of cross compilers. However we should be at the point
that:

  make docker-test-build

should run and complete all the builds it can (with non-x86 systems
skipping a whole chunk). There is some re-factoring work to be done to
make the whole system a bit more friendly to multiple host architectures.

> 3. Which images can I use to run tests? e.g. make docker-test-quick@XXXX
> .. the help output shows me ALL images, including your partial ones.

It does? It filters out the partial ones for me. Broadly the mainline OS
ones are all capable of building and running tests
(centos/debian-amd64/fedora/ubuntu/travis).

> I
> think we only want to see non-partial images for help output, or make
> clear which ones are for tests and which ones are just images.
>
> 4. docker8 is listed as a partial image, but doesn't appear to be
> consumed by anything. Can it be removed?

Yes.

>
> - Ditto for debian-sid.

Probably - I almost removed it last time but Phillipe convinced me to
keep it in. I think now buster is out and has packaged gcc's for all the
old arches (alpha etc) we can probably get rid of it.

> - Ditto for debian-ports.

This was useful for compilers for old arches but I think it can be got
rid of now. It's basically sid with a different repo URL.

> (should debian-sid and debian-ports actually be promoted to non-partial
> images? or, how do I configure the other debian targets to use these as
> a base instead?)

For true any Debian you want you can use Debian bootstrap - although
it's main use case is for setting up binfmt_misc foreign arch images.

--
Alex Benn=C3=A9e

