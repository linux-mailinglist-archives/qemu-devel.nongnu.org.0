Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3BF813A1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 09:45:08 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huXg3-00015r-S7
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 03:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42291)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1huXfI-0000bE-AH
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 03:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1huXfH-0001AH-7N
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 03:44:20 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52334)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1huXfH-00019t-0g
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 03:44:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so73682395wms.2
 for <qemu-devel@nongnu.org>; Mon, 05 Aug 2019 00:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yyKB1tEK9y5babniTVRvwuAuqYiS7/77rKlbdHSVZGw=;
 b=VNjICi14aWcaVe1Hf/FKmOZ5hFj6C1RSBMXUmWTX8niYl7l3ThEDRrcwVVq9eNitfU
 XQdYglqJRHwoip9hTc/TYE2FYTUxQ7B9ax/X4B09/8XfHlVFAdpmvCLMWnlIH/A9ZuoH
 nZszTvKFnCm/zFuvYictqkhMhKg8s15XZ22XelSWEOdpniwzoBMJn2evP5jJqdaCs18g
 6fP8Vpny3if5CcmzM1ddLiEoIZFRjZK0nv82bgnxJQSIQj/QMDsrbc/mYqcdMbMJIzfu
 pztr3WwzPiNSNh/GBarZQwKeeo1/ohpmh0ynNfvJUmfjp/C+awoCK2ocnhiNQNsWlyQM
 9nSQ==
X-Gm-Message-State: APjAAAXJjZCSCQA/XfzyiXX7x52kba0Q8BGEhJm6IfJddElNVpvLyOfJ
 ZFeuVi6RRzrzd2rgGkFAQ92FAg==
X-Google-Smtp-Source: APXvYqzzO7j3rEMFf5D+ejrtb9/yd0/wg1Png5as4M7ZkBYY3rO56Px6wv1u27/5ntA6A/derwiJRA==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr16673700wme.12.1564991057914; 
 Mon, 05 Aug 2019 00:44:17 -0700 (PDT)
Received: from [192.168.178.40] ([151.21.165.91])
 by smtp.gmail.com with ESMTPSA id u186sm159043915wmu.26.2019.08.05.00.44.17
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 00:44:17 -0700 (PDT)
To: "Oleinik, Alexander" <alxndr@bu.edu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190805071038.32146-1-alxndr@bu.edu>
 <20190805071038.32146-3-alxndr@bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <bf80fd0a-0f5a-6013-0e3b-835a7c2d947f@redhat.com>
Date: Mon, 5 Aug 2019 09:44:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805071038.32146-3-alxndr@bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [RFC PATCH v2 02/17] fuzz: Add fuzzer configure
 options
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
Cc: "bsd@redhat.com" <bsd@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/19 09:11, Oleinik, Alexander wrote:
> This adds sanitizer/fuzzer related cflags and adds tests/ to the include
> path. This include change is needed for qos to build, and is normally
> located in tests/Makefile.include, but currently the fuzzer builds from
> the i386-softmmu target, not anything in tests.

Another possibility is to move the libqos and libqtest includes from
tests/ to include/.

Paolo

