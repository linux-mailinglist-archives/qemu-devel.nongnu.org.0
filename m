Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0F296A11
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 09:07:17 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVrAS-0007Aw-21
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 03:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVr9P-0006kn-Vu
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVr9N-000239-30
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603436767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BH7UOLiSybIlezS0ozJDDt3TzCnETLf6U4orWkNBW30=;
 b=OO59Yev0TPmsaVFREgQQI84Ne0gIGjfq0L2Cf5C3bJeg8TpkFCrxgkxi/hPUoW0BTeAgZD
 YKe7K2e1kO45i5CRg39xO/8x9QGT6YpBKbWyPfEc4z1o8k42PPbrqxx+R1QIfHjiHyuONN
 xyCvLowD/hQQ7sg/xPOQLmZp3SxY/u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-PpVO0TohMF2UZaCgA6oRbA-1; Fri, 23 Oct 2020 03:06:03 -0400
X-MC-Unique: PpVO0TohMF2UZaCgA6oRbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8457804B76;
 Fri, 23 Oct 2020 07:06:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-123.ams2.redhat.com [10.36.112.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8B6260BFA;
 Fri, 23 Oct 2020 07:06:00 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] accel: Remove _WIN32 ifdef from qtest-cpus.c
To: Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org
References: <20201013140511.5681-1-jandryuk@gmail.com>
 <20201013140511.5681-2-jandryuk@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4ea31bf0-7567-17f9-df16-1f0570afa62a@redhat.com>
Date: Fri, 23 Oct 2020 09:05:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201013140511.5681-2-jandryuk@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/2020 16.05, Jason Andryuk wrote:
> dummy-cpus.c is only compiled with CONFIG_POSIX, so the _WIN32 condition
> will never evaluate true.  Remove it.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> v2: New in v2
> ---
>  accel/qtest/qtest-cpus.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/accel/qtest/qtest-cpus.c b/accel/qtest/qtest-cpus.c
> index 7c5399ed9d..db094201c1 100644
> --- a/accel/qtest/qtest-cpus.c
> +++ b/accel/qtest/qtest-cpus.c
> @@ -29,10 +29,6 @@
>  
>  static void *qtest_cpu_thread_fn(void *arg)
>  {
> -#ifdef _WIN32
> -    error_report("qtest is not supported under Windows");
> -    exit(1);
> -#else
>      CPUState *cpu = arg;
>      sigset_t waitset;
>      int r;
> @@ -69,7 +65,6 @@ static void *qtest_cpu_thread_fn(void *arg)
>      qemu_mutex_unlock_iothread();
>      rcu_unregister_thread();
>      return NULL;
> -#endif
>  }
>  
>  static void qtest_start_vcpu_thread(CPUState *cpu)
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


