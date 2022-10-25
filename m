Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4260D63D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 23:38:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onRbZ-00086q-4e; Tue, 25 Oct 2022 17:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onRbU-00084X-C1; Tue, 25 Oct 2022 17:36:58 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onRbQ-0000Rt-QA; Tue, 25 Oct 2022 17:36:55 -0400
Received: by mail-yb1-xb34.google.com with SMTP id 63so16414513ybq.4;
 Tue, 25 Oct 2022 14:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EwQcehuff9YS/FX9kOjTQrai4kmtBjvWheX60ujBQEw=;
 b=HZxJH29cVBtgVGfylP9xtlZPgZgoQYrYY4Re1qo0IcCXyLboVoEqF5cqlMQHhM/9dj
 dfbY+eMMqTcDp/Qfg01zpW83BqjHBT30qwxyL4mpjkBBMl/ksqtCpAK/mNfnLWWYNqNv
 MH0cKjZLl4Y4xVBPEtcLl2veRn3E6uUi2WEBWlCE+WXbjXllIGm9d47ymT9sLmHMyrLT
 DtiQVslu8PJX+ZoZaACkwFlfTOLW0qUpg6Tmad6Ryjk4aF6Uk1mlk8oLoT+4bM1EUL68
 i9dzrIz24ihyyVyfINwTZPYyBohvJg2J4sSN492MBBfQ0mZW77B2GjxHJZrer4ibdoV4
 6x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwQcehuff9YS/FX9kOjTQrai4kmtBjvWheX60ujBQEw=;
 b=Dcer2Yux4rjSauu0XdnizQH3hirdqsihFWd6u1MEWVMeKzPdyKwTSv4x+cOAjm+4wg
 iHWMZ53zRzpibzn/nGEoO8w8bb0WMFr1hbCwwCIlXvBx78aUxGgIJ+ErsK2iNO0SDMV+
 fQN2YhBzvwyNCkDG9MDn6qg1p0lFQvYjzHJ7H3xOnNfBWNTwt5JmtlPUrs3FBX4jLEH4
 C/TCVWqtDrLe6bRMSE4ckaZe3CvxdxMs/LZk894zDtwptyuQMpvaYCMmq4JZHFmOAQDF
 OppOzKOc0CGPzdnkpz4I47fH5IQL4tH9Y6YnuAue23UMSv9X74DQ0Eg1cxCy5VT/jEAS
 z1MA==
X-Gm-Message-State: ACrzQf24EktAnlXLGkHxpd28Sgx2lEaXv6o631t6vpBOAPmMchwYmyVs
 pR9TBTw0MBna5+AEX5irLmLfna20RBuuhWyfk/c=
X-Google-Smtp-Source: AMsMyM7G+dga1S3fpvqBA81DbrOPl3nsVfpjPDq9IaYaWOgl8Ykwr9FEF6FXjeQiPdHClOw3K7Q5C8NfaVzZjCumVGg=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr37215843ybe.642.1666733811212; Tue, 25
 Oct 2022 14:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221025075003.18161-1-marcandre.lureau@redhat.com>
In-Reply-To: <20221025075003.18161-1-marcandre.lureau@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 25 Oct 2022 17:36:39 -0400
Message-ID: <CAJSP0QUGGN7KuBzr=8q5erpUiVZUK+kvfgxwfjW6Z3TODYZwJA@mail.gmail.com>
Subject: Re: [PULL v2 00/11] Dump patches
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please solve this CI failure:

c++ -o qemu-system-s390x ...
/usr/bin/ld: libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o: in
function `arch_sections_add':
/home/gitlab-runner/builds/Y1MP9VSY/0/qemu-project/qemu/build/../target/s390x/arch_dump.c:392:
undefined reference to `kvm_s390_get_protected_dump'
/usr/bin/ld: libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o: in
function `cpu_get_dump_info':
/home/gitlab-runner/builds/Y1MP9VSY/0/qemu-project/qemu/build/../target/s390x/arch_dump.c:452:
undefined reference to `kvm_s390_get_protected_dump'
collect2: error: ld returned 1 exit status

https://gitlab.com/qemu-project/qemu/-/jobs/3226673649

Thanks,
Stefan

