Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA6367873
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:20:23 +0200 (CEST)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQpC-0005JX-6B
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZQny-0004So-MU
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZQnw-0006gF-WF
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619065144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NnJfGtMPOkZhOwf6FWRaM4mhKgcXDwgTmFMtagO8H2I=;
 b=OKMANJoFBnU7NNmgns91uSKsjlFQggjXhzYa24IdNROF2nSgaixzRHhwSIWKsdAWhizAmo
 0+AU3c3uUcdV0cclmVoFicQW1U/La1nLMAAPoXMz6dqlIZGP86h/eLxab7iIH6jTWeXedq
 JNqHZusa3wZpt2pfq7en0LJB3/QZMDA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-xvTC7AsnPPmQmyHluyHttw-1; Thu, 22 Apr 2021 00:18:55 -0400
X-MC-Unique: xvTC7AsnPPmQmyHluyHttw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c124-20020a1c9a820000b0290136c7a94cf3so1177830wme.3
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 21:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=NnJfGtMPOkZhOwf6FWRaM4mhKgcXDwgTmFMtagO8H2I=;
 b=YWgL6hLSZKzpcigCX1zLF7pnrpgPFaz1Y7NmhUt/7T72QaXz/1dgMdiWlc0d40TuX8
 7jCCHd6LmDC8/BfmPosV1ROTs1ZGdbyVdE7ddfhg0CV+7GKq16QTOwNDOISTvN/dRlBr
 H1Wfvsu29TJQkBZbMSQWl4lgJXR9g/oElNb1R4U51bmOnK5jrf4q9hakD0I3TmUcTglI
 /YW9aguM1j1HBmHnpoQRktjJXLARk9MgqSW8cOYK7WO4A9OA+/brYUwPqhe6vFHgayzc
 5ckf5TZ9OBfF9PlVwY2xZ+05A3f9de9kiIWtn+pHslA1V+ZceC+eXirBZcsF4tVc6S8j
 UIdg==
X-Gm-Message-State: AOAM530Hhhi/hmHJ+gLUMwCRdQ0szHpwvjgpYPjee9pxjymMdZWpGodA
 oiwf1XW+aqaT2L7/7WL+Pv/IUHrxDB5KCHlL0Z2S1gC39w5IVuTMbvZ/i6fOZOB+jSND2MltQ9V
 ziFIIJADMwNgJxms=
X-Received: by 2002:a05:600c:4f56:: with SMTP id
 m22mr1438295wmq.19.1619065133938; 
 Wed, 21 Apr 2021 21:18:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBrkdSdb9hrUIAVmXWFj2EnJs5PqrsR32F2T4cn0hftNQ+k3UstPgSRwpxIzm/tZNGTlhy9g==
X-Received: by 2002:a05:600c:4f56:: with SMTP id
 m22mr1438280wmq.19.1619065133715; 
 Wed, 21 Apr 2021 21:18:53 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b15sm1469772wrt.57.2021.04.21.21.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 21:18:53 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange"
 <berrange@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
Message-ID: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
Date: Thu, 22 Apr 2021 06:18:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas, Daniel, Stefano,

Regarding the following warning (GCC 11 on Fedora 34):

In file included from pc-bios/s390-ccw/main.c:11:

In function ‘memset’,

    inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,

    inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:

pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of
size 0 [-Wstringop-overflow=]

   28 |         p[i] = c;

      |         ~~~~~^~~

Daniel were right on IRC:

danpb: it is from a call  memset((char *)S390EP, 0, 6)     where  S390EP
is just a constant address 0x10008
danpb: the compiler doesn't now how big that is, so it seems to assume
it is zero length

This is a known GCC issue:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
"gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
pointer from integer literal"

Regards,

Phil.


