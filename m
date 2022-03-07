Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5EC4CF356
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:13:42 +0100 (CET)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Uv-0007Y8-Rq
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:13:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR8FB-0004mJ-U0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:57:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR8FA-0000PT-DD
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhJcAcbS/tzsWwhWmo6/q3tm22l/MH8icY/q4zWMU7A=;
 b=fsGqycDypJ77Xt1ATrZoQScTAot5gIDEsru9Yi/2cf1+O+hKiVv/cKcqmd8mIV3LCZuc6c
 FtNZ7IYRfrXHKqCq8L47JqN8cXpjZD5lZ+9bpnE3qHkeYfwKsTmiRtK41XcKO2mGNzfSKE
 acJNbLnM4VqSGc44XyAHA9LFq9JgrW0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-5GxTqgvJMAKIDxW3WYs_8Q-1; Mon, 07 Mar 2022 02:57:22 -0500
X-MC-Unique: 5GxTqgvJMAKIDxW3WYs_8Q-1
Received: by mail-pj1-f72.google.com with SMTP id
 p5-20020a17090a748500b001bee6752974so9308715pjk.8
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XhJcAcbS/tzsWwhWmo6/q3tm22l/MH8icY/q4zWMU7A=;
 b=D9y0Jbu/B7JaPBR9oVZDjEScVT+6nFL7Ic46rbhaidoB+T+fmpt7kMHDotCz3b98pf
 NOXE3vgQXT18S2w4NuRkrN2Wi2Mh+Dd4Tejyof6gaRQsd6v5P/m2O3MMfFzAuBwolowP
 kzxHl1GxzIqk6YYjJVmQSS8zUJHQVAsC9RIjqioRa/ob5+qfzuVMtErK3hlWpLUMKkHH
 Ewqth3uBXzOCRVLUrobjlMCwq4NiB7JZFq/7WnKTAy8ZhENG54QYtUhWyMcmJ5jvFYqX
 WnOuZRhY3D7mNMWKL+XiMHterKSmKNzdIrSErkoVPUdUX22khFVI1nrbVYmpkmz7A8UY
 XK7w==
X-Gm-Message-State: AOAM532Eyb9v/se5Nyzxtuaq76b8Q5+6LBImH+cY2SinJh5e5luUnD9c
 xqrsHyxUZ3WmZ13Dmm4SW1jWV0y3cBn0VZomev/7DwVEyGT0uRWzmWLZOzna6Z1HDnKB4YKK4Zd
 fDoJIu2CsCMjZLuw=
X-Received: by 2002:a63:9245:0:b0:377:7e40:1905 with SMTP id
 s5-20020a639245000000b003777e401905mr8574127pgn.139.1646639841688; 
 Sun, 06 Mar 2022 23:57:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJcg9TglOsG1PN4MMzv3WH1+UoItal5L5S75VwnhXKdv/EIpdGEzPJGwt+WqOh0V9A0zZDuw==
X-Received: by 2002:a63:9245:0:b0:377:7e40:1905 with SMTP id
 s5-20020a639245000000b003777e401905mr8574104pgn.139.1646639841367; 
 Sun, 06 Mar 2022 23:57:21 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 m11-20020a17090a3f8b00b001bc299e0aefsm17771388pjc.56.2022.03.06.23.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 23:57:21 -0800 (PST)
Date: Mon, 7 Mar 2022 15:57:16 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 11/18] tests: expand the migration precopy helper to
 support failures
Message-ID: <YiW63O5qeye62I9M@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-12-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-12-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 05:49:25PM +0000, Daniel P. Berrangé wrote:
>  static void test_precopy_common(const char *listen_uri,
>                                  const char *connect_uri,
>                                  TestMigrateStartHook start_hook,
>                                  TestMigrateFinishHook finish_hook,
> +                                bool expect_fail,
> +                                bool dst_quit,
>                                  bool dirty_ring)
>  {
>      MigrateStart *args = migrate_start_new();
> @@ -875,24 +890,32 @@ static void test_precopy_common(const char *listen_uri,
>  
>      migrate_qmp(from, connect_uri, "{}");
>  
> -    wait_for_migration_pass(from);
> +    if (expect_fail) {
> +        wait_for_migration_fail(from, !dst_quit);

Two more thoughts..

(1) Shall we move MigrateStart creation to be even upper?  Then we avoid
    passing over these parameters but merge these new parameters into
    MigrateStart too.  After all we used to have similar long lists of
    params and we merged them into MigrateStart.

(2) Shall we leverage MigrateStart.hide_stderr?  I saw a bunch of errors
    dumped even if all things run as expected.

-- 
Peter Xu


