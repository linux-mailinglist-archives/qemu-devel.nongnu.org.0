Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330257A989
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 23:56:04 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDvCE-0002S0-Qc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 17:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDvAY-0000n6-El
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 17:54:18 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:40736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDvAW-0005Hz-KY
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 17:54:18 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31d85f82f0bso155137467b3.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 14:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQp0Joy/9+SEKoFiXOBeJpQcs5aDAzl+1PDjPMeqdiU=;
 b=FqCw7F3egLqVhteFHbOooVW4WGr6A8t/PF0jiNHubsKJusgMvQo2peiO9IxeGifVlY
 Xs/schPm3XqzJb4LL3tXGwHqQ/lJINb2gP9p5Pxq8kg2AX/xOUxGr9oF8T1svNWgdYJz
 gDFDI3w7FaV8+dGuFmDNbI4HFOwW3TswXz98bK4+KMgioS7OBxPrTeC2azX/YKgWbiJi
 WaWZ2hyccI2twDRrg5mlTYSkFzs/LnRz8HYDZ6ojCt4QU5dOS9q7uxRgq1LH503MT76z
 m4PY6hqccx2aWys3o2Q1mRixCTwmqg+61Hn0petKfLMDH6cOxURVTbEZqzvjuDl+XH0W
 spvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQp0Joy/9+SEKoFiXOBeJpQcs5aDAzl+1PDjPMeqdiU=;
 b=Aia6N4eTCKlev1hPZe/eKhd1m22Ku222RdEL0LjN/49y63Io4JGA4XTFAFhSMkSBWq
 lo+vh0xNWHfCGZHLABSADlmMmyvatqauOG3bI8iX/kuCZ98G9jdLE5c8/63tTk8vLTtP
 hI7Zo1/7zph5pIv7Cxeg1i/B7lS2hwFBa1M1QBjEr8wM+zqPGSKDzIJOvzTrI7JO5uc2
 LbFteSDWx4MwmioXvQtM2AaPRlN4ukHCM/AdRahOnJnEUaOyQybT+c99n3k09N7WtRxK
 w1vuS+NebiYSvv/jHsYGGO59bHr7w0dXuNFRUW87i11hTXYsLAyepcUEsrg8vsqTT6XZ
 +3Tw==
X-Gm-Message-State: AJIora81cDvU1723rjRmHEVkhlOBD0VMpfx35oBxUqVPHTK0A03kqW8q
 bFyO/JE0uV49evqr8uT4BxJzDRJrWgMtjitEdm2GNQ==
X-Google-Smtp-Source: AGRyM1uByEumnOF+0SfVN38Bxco2SkRX1+3dRM1r6zyB7r14WCmB3FWmPBKYmYn0ulKUcLsLbUaUgkOaDH4rXKqWjic=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr39004414ywe.455.1658267652237; Tue, 19
 Jul 2022 14:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220719170221.576190-1-dgilbert@redhat.com>
In-Reply-To: <20220719170221.576190-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 22:53:33 +0100
Message-ID: <CAFEAcA_+UkfoetuMeQLGGhg_7_6=rdT3O+z0M8bE0=2Zt-j-TQ@mail.gmail.com>
Subject: Re: [PULL 00/29] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com, 
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com, 
 huangy81@chinatelecom.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jul 2022 at 18:16, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:
>
>   Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220719c
>
> for you to fetch changes up to ec0345c1000b3a57b557da4c2e3f2114dd23903a:
>
>   migration: Avoid false-positive on non-supported scenarios for zero-copy-send (2022-07-19 17:33:22 +0100)
>
> ----------------------------------------------------------------
> Migration pull 2022-07-19
>
>   Hyman's dirty page rate limit set
>   Ilya's fix for zlib vs migration
>   Peter's postcopy-preempt
>   Cleanup from Dan
>   zero-copy tidy ups from Leo
>   multifd doc fix from Juan
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> ----------------------------------------------------------------

Fails to build on some configs, eg:
https://gitlab.com/qemu-project/qemu/-/jobs/2743059797
https://gitlab.com/qemu-project/qemu/-/jobs/2743059743

../tests/qtest/migration-test.c: In function 'test_postcopy_preempt_tls_psk':
../tests/qtest/migration-test.c:1168:23: error:
'test_migrate_tls_psk_start_match' undeclared (first use in this
function)
1168 | .start_hook = test_migrate_tls_psk_start_match,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/qtest/migration-test.c:1168:23: note: each undeclared
identifier is reported only once for each function it appears in
../tests/qtest/migration-test.c:1169:24: error:
'test_migrate_tls_psk_finish' undeclared (first use in this function)
1169 | .finish_hook = test_migrate_tls_psk_finish,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/qtest/migration-test.c: In function 'test_postcopy_recovery_tls_psk':
../tests/qtest/migration-test.c:1247:23: error:
'test_migrate_tls_psk_start_match' undeclared (first use in this
function)
1247 | .start_hook = test_migrate_tls_psk_start_match,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/qtest/migration-test.c:1248:24: error:
'test_migrate_tls_psk_finish' undeclared (first use in this function)
1248 | .finish_hook = test_migrate_tls_psk_finish,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/qtest/migration-test.c: In function 'test_postcopy_preempt_all':
../tests/qtest/migration-test.c:1268:23: error:
'test_migrate_tls_psk_start_match' undeclared (first use in this
function)
1268 | .start_hook = test_migrate_tls_psk_start_match,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/qtest/migration-test.c:1269:24: error:
'test_migrate_tls_psk_finish' undeclared (first use in this function)
1269 | .finish_hook = test_migrate_tls_psk_finish,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~
At top level:
../tests/qtest/migration-test.c:1264:13: error:
'test_postcopy_preempt_all' defined but not used
[-Werror=unused-function]
1264 | static void test_postcopy_preempt_all(void)
| ^~~~~~~~~~~~~~~~~~~~~~~~~
../tests/qtest/migration-test.c:1244:13: error:
'test_postcopy_recovery_tls_psk' defined but not used
[-Werror=unused-function]
1244 | static void test_postcopy_recovery_tls_psk(void)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/qtest/migration-test.c:1164:13: error:
'test_postcopy_preempt_tls_psk' defined but not used
[-Werror=unused-function]
1164 | static void test_postcopy_preempt_tls_psk(void)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- PMM

