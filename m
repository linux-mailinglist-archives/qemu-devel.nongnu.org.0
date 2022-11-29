Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDEB63BFB3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 13:06:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozzMk-0000Rt-I9; Tue, 29 Nov 2022 07:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozzLq-0008FZ-2l; Tue, 29 Nov 2022 07:04:48 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozzLo-0002Hz-7U; Tue, 29 Nov 2022 07:04:37 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3cbdd6c00adso42533597b3.11; 
 Tue, 29 Nov 2022 04:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lZqYt7DGSda3M+AU1nq/d6A2DRd8wn86Aq2Rs8xNEyI=;
 b=gfTlGLBmHJxhBTD5VRZOQLCDl7uk2++og36qk5Sg42xpBzsXWFmctYAZGjYZxz7ZPC
 UuTLL6zOu+qW5axzMa3ZevnrjqaHbVKeqnnOrqoV3mPW+5B+wBPDB1dK/SyT/0Xo54VF
 9PX6C//OPsVcWXsQ/IWeDMTvDA/9VN7d6Ypqog/xQD8ll/hZEUd8ym9uxD5wB3WXOSoa
 0l/e0D0J7a/2HM1pVyKoPcD/9JLazWWm3e1RPbZ6kUEVS3l7rx+Uha3Rsu4JEJ6R2Bvz
 DHZVH2iyTQcMucLgHneQjbIG2ePml64wWJRCKrucTkZ1DfoXj3Am/73KAHgQhUBqpyli
 PEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZqYt7DGSda3M+AU1nq/d6A2DRd8wn86Aq2Rs8xNEyI=;
 b=7SJ39bVZdFmOiW89ksXDJB/bYPkckafyUGa5DSnJwQCZVv8dQyBTFR+i0+Ug2UnJUW
 Cqf8CdSZWTCanD5kTLDj6yahPT80jAfFD+3fJUml+XaIJQQBrSmb+g9UP9QAkNrvnGDH
 y7d+RT+osK5BJeJ40XjHtHQNXC0SpaVGIKAGigUKnaPXrpQWiTbkIi1PcHKvIX7xxkOO
 X7rX9aJSlK1/LsJIVhWOeI7LkK5MlqAxvWXh7WV3mQOhFU5I1Jz75HjO0cZd0BLg+pNo
 VUfNUiuIPiWzt/76w3s83aL0XGMxs2lPY7R5Pc7NDJG1UhHMVQvzSpbldyw+gVd1n9ge
 oVSQ==
X-Gm-Message-State: ANoB5pnXo+5v4y8SUDDJKQgrdg71+nyf3B6xf+RDzQWPcGwi0B0X3V0G
 hyy0I9QnhS1xhhr+kbQU5LCmzvOghRFMxzo5d6Q=
X-Google-Smtp-Source: AA0mqf7en6T0w+LnGI94+jS7GRQsFQDKDIvcMy4z9C6eSk/9Oom6WUrPQitZApy4i6F/likDW3tiGmji13rtVpb2GvE=
X-Received: by 2002:a81:5309:0:b0:38f:80d5:f22d with SMTP id
 h9-20020a815309000000b0038f80d5f22dmr35839493ywb.296.1669723474484; Tue, 29
 Nov 2022 04:04:34 -0800 (PST)
MIME-Version: 1.0
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <Y4UCPQ0E2ZY15aEq@work-vm> <87wn7ef6cm.fsf@linux.ibm.com>
 <Y4XT/ZxuyU7F5h1n@work-vm>
 <1a94f96b-d9b6-44af-cedb-aa17eb1a3a84@de.ibm.com>
 <618edde1-31d8-9db8-48d9-137fe81b788b@de.ibm.com>
 <Y4XcByAJBWaCo0sP@work-vm>
In-Reply-To: <Y4XcByAJBWaCo0sP@work-vm>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 07:04:22 -0500
Message-ID: <CAJSP0QWbQpysVn=oAQdvcq0WrBuPVf_MX4fbwobCLTS1AP_Ncg@mail.gmail.com>
Subject: Re: [PATCH] virtiofsd: Add `sigreturn` to the seccomp whitelist
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>, 
 qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, 
 Stefan Liebler <stli@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

To find out:
# perf record -e signal:signal_deliver
...wait for QEMU shutdown...
^C
# perf script
qemu-system-x86_64 2319136 [001] 1062886.415312:
signal:signal_deliver: sig=2 errno=0 code=128 sa_handler=7fc6ccfbabc0
sa_flags=14000004

sig=2 is SIGINT. This is just an example, I didn't run virtiofsd.

