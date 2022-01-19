Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86294938EF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:52:42 +0100 (CET)
Received: from localhost ([::1]:32976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8a1-0005Z8-Ky
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8S4-0007oJ-Vj; Wed, 19 Jan 2022 05:44:30 -0500
Received: from [2a00:1450:4864:20::534] (port=42660
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8S3-0007hF-Dh; Wed, 19 Jan 2022 05:44:28 -0500
Received: by mail-ed1-x534.google.com with SMTP id p12so9126942edq.9;
 Wed, 19 Jan 2022 02:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+TukSJz+75muE8U8/bDQhIYck9QAq94pNQoc7nqkhc=;
 b=U7/M9uj7lZ5VQnzgxnKtlXbWgfEjeRRs/ccp67rL+z4BKbUB+TfIo4kIUE79813fA7
 5eI0izwildYxy6VLih8lgmy5MututXT4C/DVWv3n+ezWPoyCC4oaiF4xTigTiqsvhZIU
 hAJfXUZ16XoFNvDAsYX5A98wFR4w081Pgbn+HcwsTQxveq6BMXUKv18BQE9mdEBczcAd
 pgu3yEcQTgitepKlYrZaYxicOpYc9KEat8NzlR4pSCPZLxfS/rNz5sEsk636mEqjhnEA
 DO+ylhZUgMjf9Sk8lBDBKjCbZBtBKvC8d8UXl61KeT1MqkKrkSSo9DHA+W3biY7Rpz20
 HhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+TukSJz+75muE8U8/bDQhIYck9QAq94pNQoc7nqkhc=;
 b=UEjtse3ZAXVC55bzry6TbOGGw7mkTbF1hCfeVG0J2ed9v10aXvYzYEPQNI6G9wuJ8i
 86TRDtkuhUf505SYlowL5b/bT6zOLR4Qmf80EwQRsj5l0YFZUwy80+a6UySi7FRYo9au
 OykmRZQKNpTZ6O0e+JowVDV71mncIHu7pJ+shaQwrXkO/mzBQ2MaLU5LY9ujKjcdDCF5
 zk/iNxNvwh76D/Of21aMYMeKhA6kT0GE+dwt375mycfIKm2o0W5ppnuOJMX9+6VLoAK+
 IrmGRWM+FQUdp5ilt+SI4KGz69DWalOUl+t47jV93TzJzzGRuv617SFbR3puL2b+y4R3
 vDWg==
X-Gm-Message-State: AOAM5336ltQa7hG5T5rCz2PTBVilgfPrlNhjSTFIdWeQBDqDsgAIi8kj
 1BTxLYZ/BJXJGFx2RQuKJ3k=
X-Google-Smtp-Source: ABdhPJxAtmjs5wKkiNKjWUCv9gnYgIkRtwlhqbAGR7mK1n3TDxb7aHBcRAiN6Qsx/bVqWdseK9ijQA==
X-Received: by 2002:a17:907:e8d:: with SMTP id
 ho13mr22818460ejc.477.1642589063104; 
 Wed, 19 Jan 2022 02:44:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id o6sm377288ejy.140.2022.01.19.02.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:44:22 -0800 (PST)
Message-ID: <6a9dafe7-b3e2-68e7-e727-2086c7ceca6d@redhat.com>
Date: Wed, 19 Jan 2022 11:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 03/16] job.h: define locked functions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
> These functions assume that the job lock is held by the
> caller, to avoid TOC/TOU conditions. Therefore, their
> name must end with _locked.
> 
> Introduce also additional helpers that define _locked
> functions (useful when the job_mutex is globally applied).
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are*nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

So, this is the only remaining issue: I am not sure about this rename.
The functions you are changing are

+void job_txn_unref_locked(JobTxn *txn);
+void job_txn_add_job_locked(JobTxn *txn, Job *job);
+void job_ref_locked(Job *job);
+void job_unref_locked(Job *job);
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
+bool job_is_completed_locked(Job *job);
+bool job_is_ready_locked(Job *job);
+void job_pause_locked(Job *job);
+void job_resume_locked(Job *job);
+void job_user_pause_locked(Job *job, Error **errp);
+bool job_user_paused_locked(Job *job);
+void job_user_resume_locked(Job *job, Error **errp);
+Job *job_next_locked(Job *job);
+Job *job_get_locked(const char *id);
+int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
+void job_early_fail_locked(Job *job);
+void job_complete_locked(Job *job, Error **errp);
+void job_cancel_locked(Job *job, bool force);
+void job_user_cancel_locked(Job *job, bool force, Error **errp);
+int job_cancel_sync_locked(Job *job, bool force);
+int job_complete_sync_locked(Job *job, Error **errp);
+void job_finalize_locked(Job *job, Error **errp);
+void job_dismiss_locked(Job **job, Error **errp);
+int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),

and most of them (if not all?) will never be called by the job driver, only
by the monitor.  The two APIs (for driver / for monitor) are quite separate
and have different locking policies: the monitor needs to take the lock to
avoid TOC/TOU races, the driver generally can let the API take the lock.

The rename makes the monitor code heavier, but if you don't do the rename the
functions in job.c are named very inconsistently.  So I'm inclined to say
this patch is fine---but I'd like to hear from others as well.

I think the two APIs should be in two different header files, similar
to how you did the graph/IO split.

Paolo

