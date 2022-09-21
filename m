Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD7A5C0489
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:46:51 +0200 (CEST)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2s6-0001rZ-H8
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ob2by-00051U-6Z
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:30:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ob2bu-0004NG-KG
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663777801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyszIAh/gLK+snvRhpt7KpSYUPtjr1iIHBM1ITmuZW8=;
 b=cIR5yiTTEw9SjUZs3cUkxTLCUM1pQhexbHR7sZrzjwvQewv8gYjSC0Hgog8cMVJqV3rz2E
 4/XDTX5JNNeV0wO1u4v1h2qBDqC6xEDYTGtzP/lF7wpRoM6yshkoMFBzQOj6jbdnlNpN6c
 C32DuUz+A9j8cpWtoht/E2lly4aixjQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-FDP7bWCeP5-GYERNg3w9_A-1; Wed, 21 Sep 2022 12:30:00 -0400
X-MC-Unique: FDP7bWCeP5-GYERNg3w9_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 v7-20020adfa1c7000000b0022ae7d7313eso2573043wrv.19
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=cyszIAh/gLK+snvRhpt7KpSYUPtjr1iIHBM1ITmuZW8=;
 b=dplIF1QKa26MONxh9fT/JIPVOT6UlcC5nGmnNfNLdc08M/QQvCQnLZ1YgUDq6rIAV0
 6H9F3Cv1BDcNJKApjR5t4xOSxiLdS6usfFb8xTt3Wnx/2ONVGJVTtL8JMiySw5tw7UDx
 7sx1dDwPRkASoNUB0QslPHO9JUDDHG/+PADeFRJqlfWErcA9Q4FLJHfthN7JwOi0AbQc
 A5kxGKiQ+NMoz1y18AY3qcp2o/SGLpAQ4wlF7Eq3C81GVpY2PzZvFOzus2FydKlfwEzt
 29R9oiistLPJKVkKBiq8vJCag2VBIl2gAkafXSQ2y5b7VHjQOm83A92rRcBJrLSOPt34
 40Vg==
X-Gm-Message-State: ACrzQf3v95G3kAd7MNqKp8GbihYPHvqFFEV+056Jwyaq3aTMSWaa69Ft
 heL4+2oH+safJfZrl2PtOH1hvNlMcVeRrM+gQ8wSZGqEq0O8s81Rw48XatOgbPrZ4/YWe1JP2Af
 4LbVOrfTExFveWis=
X-Received: by 2002:a05:600c:154a:b0:3b4:c9ec:41df with SMTP id
 f10-20020a05600c154a00b003b4c9ec41dfmr6206955wmg.109.1663777799000; 
 Wed, 21 Sep 2022 09:29:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4lPMX9QD1Thf5+xD0y2rdfI5FsxidYohvwLAXGS79fiSIMQZwNsgEszGPXDRzM9ILG6kcCgQ==
X-Received: by 2002:a05:600c:154a:b0:3b4:c9ec:41df with SMTP id
 f10-20020a05600c154a00b003b4c9ec41dfmr6206932wmg.109.1663777798783; 
 Wed, 21 Sep 2022 09:29:58 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c2cac00b003a5f54e3bbbsm3425082wmc.38.2022.09.21.09.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:29:58 -0700 (PDT)
Date: Wed, 21 Sep 2022 17:29:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 26/39] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
Message-ID: <Yys8A46EUx9AiuVe@work-vm>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-27-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920103159.1865256-27-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Bin Meng (bmeng.cn@gmail.com) wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Make sure QEMU process "to" exited before launching another target
> for migration in the test_multifd_tcp_cancel case.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Hmm you might want to put a small usleep in that loop; otherwise
it'll burn CPU.

There is a slim risk with this that another, entirely unrelated, process 
will start up with the same PID between the end of migrate_cancel
and then you'll be spinning on it rather than the 'to' qemu.

I wonder if there's a better way to check for it dieing; e.g. an error
on it's qmp interface or something?

Dave

> ---
> 
> Changes in v2:
> - Change to a busy wait after migration is canceled
> 
>  tests/qtest/migration-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index c87afad9e8..aedd9ddb72 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2133,6 +2133,10 @@ static void test_multifd_tcp_cancel(void)
>      wait_for_migration_pass(from);
>  
>      migrate_cancel(from);
> +    /* Make sure QEMU process "to" exited */
> +    while (qtest_probe_child(to)) {
> +        ;
> +    }
>  
>      args = (MigrateStart){
>          .only_target = true,
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


