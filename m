Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A402C6A67
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:08:33 +0100 (CET)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihEW-0001io-8j
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kihCu-0000st-HH
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:06:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kihCq-0000BB-LH
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606496806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VsMD/TNi6ukZFU8H+l4UaQHr6+mx6Ik2lRYX2H9mdYc=;
 b=g5jVeC55utfSZwJC7McKYSEvaJRKFjizt7p0fk1wGL9hGQ61A8EWVKDbH1/3DQIN/00W0K
 eoh1e4KsCKdVY7egChJwom7Z71vWzJpBtI4uVW2D3t2OnbDUP91e5jITP6txXca/rOpTg0
 jk/U82ubPPGgmri+rrpiYlGVCB/5GkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-jPpvFywZMzWjcGOiEJiYzQ-1; Fri, 27 Nov 2020 12:06:42 -0500
X-MC-Unique: jPpvFywZMzWjcGOiEJiYzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A51D107ACF7;
 Fri, 27 Nov 2020 17:06:40 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56B785C1C2;
 Fri, 27 Nov 2020 17:06:36 +0000 (UTC)
Date: Fri, 27 Nov 2020 12:06:34 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
Message-ID: <20201127170634.GA2271382@habkost.net>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-11-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201126223218.31480-11-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Nov 26, 2020 at 11:32:17PM +0100, Claudio Fontana wrote:
> add a new optional interface to CPUClass,
> which allows accelerators to extend the CPUClass
> with additional accelerator-specific initializations.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
[...]
> +static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
> +{
> +    CPUClass *cc = CPU_CLASS(klass);
> +    AccelCPUClass *accel_cpu_interface = opaque;
> +
> +    cc->accel_cpu_interface = accel_cpu_interface;
> +    if (accel_cpu_interface->cpu_class_init) {
> +        accel_cpu_interface->cpu_class_init(cc);
> +    }
> +}

So, now that the approach we're following to trigger the
accel_init_cpu*() call is less controversial (thanks for your
patience!), we can try to address the monkey patching issue:

Monkey patching classes like this is acceptable as an initial
solution, but I'd like us to have a plan to eventually get rid of
it.  Monkey patching CPU classes makes querying of CPU model
information less predictable and subtly dependent on QEMU
initialization state.

Removing CPUClass.accel_cpu_interface may be easy, because it
should be possible to just call current_accel() when realizing
CPUs.  Getting rid of CPUClass.cpu_class_init might be more
difficult, depending on what the ->cpu_class_init() function is
doing.

> +
> +/* initialize the arch-specific accel CpuClass interfaces */
> +static void accel_init_cpu_interfaces(AccelClass *ac, const char *cpu_type)
> +{
> +    const char *ac_name; /* AccelClass name */
> +    char *acc_name;      /* AccelCPUClass name */
> +    ObjectClass *acc;    /* AccelCPUClass */
> +
> +    ac_name = object_class_get_name(OBJECT_CLASS(ac));
> +    g_assert(ac_name != NULL);
> +
> +    acc_name = g_strdup_printf("%s-%s", ac_name, CPU_RESOLVING_TYPE);
> +    acc = object_class_by_name(acc_name);
> +    g_free(acc_name);
> +
> +    if (acc) {
> +        object_class_foreach(accel_init_cpu_int_aux, cpu_type, false, acc);
> +    }
> +}
> +
>  void accel_init_interfaces(AccelClass *ac, const char *cpu_type)
>  {
>  #ifndef CONFIG_USER_ONLY
>      accel_init_ops_interfaces(ac);
>  #endif /* !CONFIG_USER_ONLY */
> +
> +    accel_init_cpu_interfaces(ac, cpu_type);
>  }
[...]

-- 
Eduardo


