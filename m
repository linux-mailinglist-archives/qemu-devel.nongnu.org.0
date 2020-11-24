Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B16A2C2E24
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:12:53 +0100 (CET)
Received: from localhost ([::1]:60796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbs4-00034W-7d
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khboa-0007qh-53
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khboV-0000ka-Sc
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606237749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B6fDvql1+VIZjU7fa8StBYOUYv9dnlbIEyJ6RWzY6H8=;
 b=VTX/c98CuKWnfQK1CkAPWWY6fNWbtHcW8geCy3lYum+yLC3PGtvaD/TlPi6LBVrni0k1Yw
 Ck0hiM2WVbYeCY5btKZbta8hbKZbO5SfUCpFW0gIhldpqzfLww4QYtDuEjqGIlLyaKcCLs
 sap5BLWvCk3GVHo1Ru1WdG2YXujziWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-gtRNUmTTO-ytTSWAym45PA-1; Tue, 24 Nov 2020 12:09:06 -0500
X-MC-Unique: gtRNUmTTO-ytTSWAym45PA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 202541012E74;
 Tue, 24 Nov 2020 17:08:37 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33D755D9C0;
 Tue, 24 Nov 2020 17:08:33 +0000 (UTC)
Date: Tue, 24 Nov 2020 12:08:32 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 09/12] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <20201124170832.GS2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-10-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201124162210.8796-10-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 05:22:07PM +0100, Claudio Fontana wrote:
> apply this to the registration of the cpus accel interfaces,
> 
> but this will be also in preparation for later use of this
> new module init step to also register per-accel x86 cpu type
> interfaces.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
[...]
> diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
> index b4e731cb2b..482f89729f 100644
> --- a/accel/qtest/qtest.c
> +++ b/accel/qtest/qtest.c
> @@ -32,7 +32,6 @@ const CpusAccel qtest_cpus = {
>  
>  static int qtest_init_accel(MachineState *ms)
>  {
> -    cpus_register_accel(&qtest_cpus);
>      return 0;
>  }
>  
> @@ -58,3 +57,12 @@ static void qtest_type_init(void)
>  }
>  
>  type_init(qtest_type_init);
> +
> +static void qtest_accel_cpu_init(void)
> +{
> +    if (qtest_enabled()) {
> +        cpus_register_accel(&qtest_cpus);
> +    }
> +}
> +
> +accel_cpu_init(qtest_accel_cpu_init);

I don't understand why this (and the similar changes on other
accelerators) is an improvement.

You are replacing a trivial AccelClass-specific init method with
a module_init() function that has a hidden dependency on runtime
state.

-- 
Eduardo


