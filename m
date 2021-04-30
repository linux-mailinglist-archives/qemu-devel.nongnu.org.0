Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB0636F863
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:21:50 +0200 (CEST)
Received: from localhost ([::1]:34726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQHN-0007rI-H7
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcQFm-0006xQ-Dj
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:20:11 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcQFk-00018v-4m
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:20:10 -0400
Received: by mail-wm1-x331.google.com with SMTP id g65so8383218wmg.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=57J0MCdPWIWz0d9ZOCjQaZxhH86DGFdQBh/7b5hyuLA=;
 b=De67EsgCcrfbIkXhZd2u9PRdMbhK8dsbVffAsiXNFesHPiHiMfPcaTTU4iqyHQV5bs
 zB2PFQFtci+8g2JDgjKvdNDPvnh7EfZRePdRzW44EBtxCp11Tjok/najgk1H6EMHo7Wj
 fuCkKwZXFJ9MtXN2Bmrz2TDJ35ncIQb7+RWmThUYL56WokUsxW5VIlOUA7PBtSZsZkug
 3Ts7QFBLr8Hw7rNHsdISoe3lnRVfsHyvzOStVSalOfBQfEdj/xpiWEu1Jo9y1/GpqYwV
 CQFiYi/9TvMOXIw9N+qekiE86YiiebKqP1H2YGQuSLnjsFAfepkZTI1hRbKuF4ZiRqtl
 ajMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=57J0MCdPWIWz0d9ZOCjQaZxhH86DGFdQBh/7b5hyuLA=;
 b=PkbKb5hmX+MFWMl5DyOdyBB88j5U3kvOS30VD6iVBeoYvwP4qiLFULlsryS3xvc6qG
 iKTbr9F0cYzmKG0Q1xESfte9TnirjqxmSCmsnG3ORo6gaEgYb4WKlI+1d7aX/BZnlprE
 B2d3LxSnqTWandry/PbQerWFw4ApqE6tbSqpx4MtkyzI62tuhLc+ouCMHEVgaW9aRNf5
 7z+TTotrBsy6+a8QuS9F4KOhDrcNAflYYvCQwvVcwu3+0Fp9jKiUm8WYeDlj+Aj3w+1p
 awMXlJ7LHS0uOIblPy8LqsLtfK8Uj+gMkvIX3oakEPq2OW3QJT4k2IujQwPQPtKi48gK
 h+hg==
X-Gm-Message-State: AOAM532RV2dkkwFatye6/h5YHMnpxiiAfJih5+pfjRJtGM94x3P81dao
 nMA6Nc3yilIb/TZ2tJGwJ4DL1w==
X-Google-Smtp-Source: ABdhPJzLWA3oazlTmYnzBTECU9ifJBOLU+juy9LhMeFCIkELyzzsvz6s7AwVdQX09zy3e4dQ7RlKKQ==
X-Received: by 2002:a7b:c006:: with SMTP id c6mr5327522wmb.129.1619778005080; 
 Fri, 30 Apr 2021 03:20:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm13179086wmc.44.2021.04.30.03.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:20:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 375761FF7E;
 Fri, 30 Apr 2021 11:20:03 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-7-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 06/12] qtest/arm-cpu-features: Remove TCG fallback to
 KVM specific tests
Date: Fri, 30 Apr 2021 11:19:53 +0100
In-reply-to: <20210415163304.4120052-7-philmd@redhat.com>
Message-ID: <87fsz8vzu4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
> tests are now only being run if KVM is available. Drop the TCG
> fallback.
>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

