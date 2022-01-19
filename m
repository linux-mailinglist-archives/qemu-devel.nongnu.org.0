Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9C4937E2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:02:37 +0100 (CET)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7nY-00038t-C5
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7j3-0000cY-OG; Wed, 19 Jan 2022 04:57:57 -0500
Received: from [2a00:1450:4864:20::331] (port=51893
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7j2-0007He-9P; Wed, 19 Jan 2022 04:57:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id c2so4250623wml.1;
 Wed, 19 Jan 2022 01:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FcwZDtAGdeLe6OLqP3pX06g5SbtO/KFgWK1e9ktvWwg=;
 b=W5tQRMiwu1q9qrbDQyl0Nq/+GGyZqulEw7V565cUiibBxj2iPBT9Y+WTU1F4Qw9ZIV
 bZGeMKQEZUTfWANTwttsUQlUxZ7Dk5t5XGH0kWawpU+tpeeUWyNrQ1HYaLwAtCnJSkMi
 o3KBgZc4jPKk6WKaSvmLbFDxtj7cyzyXI5j+ObuEMeAvtRzKEh/GQyH2bOAnzXeFA1tc
 Nb023kTv1jhLkT7F2tv146jo3iOj9yq8cyfYkwwwc8nVVB+U6gZ4pUMc8SsdrCx/8H5v
 Tl5Vom6gKhhOsiJL36gr2p9E+CafWTDK16dy06BZi8QbcbHzTL22Ng65m2YTHvYmbKba
 S/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FcwZDtAGdeLe6OLqP3pX06g5SbtO/KFgWK1e9ktvWwg=;
 b=xaHeRiRDb93CJNJ6CQFtdxa0kSP1cdZJMPwiVMlNQlNyDcET9QOfCeQpGsKXgT0FbK
 W13fRgLztnqz/Sm3T1JPwNqmrPL8BQopC+wawZJ7xdw5CYUpwzfky++8Amt7uzLHRg6S
 roBLofwBugWfURW0ERKW2C9xpuy54NG5pvLaY9FZXoRwUaLskmv7NMv05vr5v/Z+/ah2
 TWVXbVhcxx+joF5urs7Pl/M6wgP/RSGUQTyycMtwkjCTIQVx52xvaIWJrBRVROzBLQBc
 Gr5Uo41gMWSKH1v0yUbuomBmr/Ih2HgxDEWeBzpcrwno8V13b08oPCz96YG7WdxtfTG0
 CL9Q==
X-Gm-Message-State: AOAM5320rllCSEjJVR7Hgom6RrzxytPLfGNkp02bJ0QM5wG/bSI8AS9U
 ISHFW5//kwfshRgGHybNKWo=
X-Google-Smtp-Source: ABdhPJyyrRkb1/97Myi7462PNXOMNFOsCG1pccmhVAsV/st3RVErRbR9ccI3dv+wRK/SxcFgVfDAFg==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr1243021wmh.170.1642586274551; 
 Wed, 19 Jan 2022 01:57:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id i13sm6200766wmq.45.2022.01.19.01.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:57:54 -0800 (PST)
Message-ID: <e89189e7-515a-e231-d17b-076d5137ea33@redhat.com>
Date: Wed, 19 Jan 2022 10:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 02/16] job.h: categorize fields in struct Job
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-3-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 15:01, Emanuele Giuseppe Esposito wrote:
> +    /** Protected by job_mutex */

Technically not yet true.  You can add this in patch 15 and at the same 
time remove this one:

>        * Set to false by the job while the coroutine has yielded and may be
>        * re-entered by job_enter(). There may still be I/O or event loop activity
> -     * pending. Accessed under block_job_mutex (in blockjob.c).
> +     * pending. Accessed under job_mutex.

Paolo

