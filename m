Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17239DD76
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:17:27 +0200 (CEST)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqF8A-0003LL-0f
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqF79-0002Rm-MU
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqF76-0002f7-GJ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623071779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zZHMo6ptWjPE7czEJ//BuQkE8oL6DgKVCgbQSDr9Ug=;
 b=Nygw3kytVVFsOmhPq2ZxvT2BzJeOh9S9L8iXP1YQ1O/kQJ425daIAkN21s4bri8oNrKdj0
 bnroKUC89WBEfrutyxSlBnyPMqsi/Rgp61melr8ppKcUoOKfHW7cAcvKrLjodWqtTiQbdq
 b5o44INc2oPqY1gasIUAq6VKBoNuyqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-krNGwjB9Poip6JzaE0ydJw-1; Mon, 07 Jun 2021 09:16:17 -0400
X-MC-Unique: krNGwjB9Poip6JzaE0ydJw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a19-20020a1c98130000b02901960b3b5621so2330485wme.8
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2zZHMo6ptWjPE7czEJ//BuQkE8oL6DgKVCgbQSDr9Ug=;
 b=tX4dYfW1KcHkxxflzfVaCs5UwWJmDiz4cK5J+ct8vKwDXFohKtDXGpNlbGmS9wccRP
 4KoQ+WAxvnBzljP/XSpA+myWr8cprqRlmqCUtvIDOc8uFhwf5HpctuZtn+amCLFiJScP
 tBs3SnlUMKQ93qIlgYjCrzFu1pLJiBvGuleqGevIO5a0UMVKjbTj/tIt6S8PW450thpP
 AN8jPrWSgWL7pKriOFRjrhovJ1Kzn5AjCdiTCHjC02/ow3qPCxFCt2QfjEINjwJWMJ5s
 odTIADgHXb9srDkQpS3xBGMZPO+NtO5zRF/8S8AZ7VkjYsNPZVR65LpyDw21QxxT0Ayw
 XIfQ==
X-Gm-Message-State: AOAM530gcDDWc157dChZsSfEMEi7WgSEPxB8uAy8h7bu3mB7/ZbdDBln
 w3H8oEIvRnSfYXDwNbs/JvhJ5lKCvpkuoYYHyFLcWaZ1paJfH4wPrh/KSSzrXxYdh422GWtwZ6l
 Fk2AbdVFmv++eaV0=
X-Received: by 2002:a05:600c:2248:: with SMTP id
 a8mr17236657wmm.5.1623071775930; 
 Mon, 07 Jun 2021 06:16:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxY/KFLhO5s3q4EMXfLg3reiWyWFm1NH4Ee8HtI1+Zv2fpY27gQkOop/QP32sDg6kQLepIzg==
X-Received: by 2002:a05:600c:2248:: with SMTP id
 a8mr17236635wmm.5.1623071775754; 
 Mon, 07 Jun 2021 06:16:15 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id o9sm13707257wri.68.2021.06.07.06.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:16:15 -0700 (PDT)
Subject: Re: [PATCH v16 03/99] qtest: Add qtest_has_accel() method
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <088d554c-ef63-0f79-cedb-bdc89b532490@redhat.com>
Date: Mon, 7 Jun 2021 15:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Introduce the qtest_has_accel() method which allows a runtime
> query on whether a QEMU instance has an accelerator built-in.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-4-philmd@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h |  8 ++++++++
>   tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index a68dcd79d4..d80c618c18 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -763,6 +763,14 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
>    */
>   bool qtest_probe_child(QTestState *s);
>   
> +/**
> + * qtest_has_accel:
> + * @accel_name: Accelerator name to check for.
> + *
> + * Returns: true if the accelerator is built in.
> + */
> +bool qtest_has_accel(const char *accel_name);
> +
>   /**
>    * qtest_set_expected_status:
>    * @s: QTestState instance to operate on.
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 825b13a44c..6bda6e1f33 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -393,6 +393,35 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
>       return qts;
>   }
>   
> +bool qtest_has_accel(const char *accel_name)
> +{
> +    bool has_accel = false;
> +    QDict *response;
> +    QList *accels;
> +    QListEntry *accel;
> +    QTestState *qts;
> +
> +    qts = qtest_initf("-accel qtest -machine none");
> +    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
> +    accels = qdict_get_qlist(response, "return");
> +
> +    QLIST_FOREACH_ENTRY(accels, accel) {
> +        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
> +        const char *name = qdict_get_str(accel_dict, "name");
> +
> +        if (g_str_equal(name, accel_name)) {
> +            has_accel = true;
> +            break;
> +        }
> +    }
> +    qobject_unref(response);
> +
> +    qtest_quit(qts);
> +
> +    return has_accel;
> +}

This spawns a new instance of QEMU each time the function is called - which 
could slow down testing quite a bit if a test calls this function quite 
often. Would it be feasible to cache this information, so that you only have 
to run a new instance of QEMU once?

  Thomas


