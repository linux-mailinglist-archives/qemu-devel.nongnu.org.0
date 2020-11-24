Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D332C3081
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 20:09:57 +0100 (CET)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khdhK-0001jU-0B
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 14:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khdfp-0000t0-DI
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khdfn-0000fv-93
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606244897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pLDYl4pIeSGuH9r/zA7/uQ/7SVs7rxxP+TV8SOPOddE=;
 b=VCb0aCNlNk5UZ4j11zVB+snzjn/Adoq6nSB6lXA/jR3gfXkvzSyvVMbpNenmd5jGtYce01
 bN4C7ZKkFWew1sRyZGsYDYA9DIuPzh/9xCJBePt5wg2nfQqsA09BcXpoLDrgnZIsvJ+By0
 SF2tFO3BoHJLVPw6EqrveHdQwwLf5Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-6Kjfm015O4muyqp86ieQug-1; Tue, 24 Nov 2020 14:08:15 -0500
X-MC-Unique: 6Kjfm015O4muyqp86ieQug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E55EE106B6A3;
 Tue, 24 Nov 2020 19:08:12 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA1460BE5;
 Tue, 24 Nov 2020 19:08:08 +0000 (UTC)
Date: Tue, 24 Nov 2020 14:08:07 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 09/12] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <20201124190807.GW2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-10-cfontana@suse.de>
 <20201124170832.GS2271382@habkost.net>
 <a7bed792-5c6f-c49e-946c-f705707ce685@suse.de>
MIME-Version: 1.0
In-Reply-To: <a7bed792-5c6f-c49e-946c-f705707ce685@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Tue, Nov 24, 2020 at 07:29:50PM +0100, Claudio Fontana wrote:
> On 11/24/20 6:08 PM, Eduardo Habkost wrote:
> > On Tue, Nov 24, 2020 at 05:22:07PM +0100, Claudio Fontana wrote:
> >> apply this to the registration of the cpus accel interfaces,
> >>
> >> but this will be also in preparation for later use of this
> >> new module init step to also register per-accel x86 cpu type
> >> interfaces.
> >>
> >> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >> ---
> > [...]
> >> diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
> >> index b4e731cb2b..482f89729f 100644
> >> --- a/accel/qtest/qtest.c
> >> +++ b/accel/qtest/qtest.c
> >> @@ -32,7 +32,6 @@ const CpusAccel qtest_cpus = {
> >>  
> >>  static int qtest_init_accel(MachineState *ms)
> >>  {
> >> -    cpus_register_accel(&qtest_cpus);
> >>      return 0;
> >>  }
> >>  
> >> @@ -58,3 +57,12 @@ static void qtest_type_init(void)
> >>  }
> >>  
> >>  type_init(qtest_type_init);
> >> +
> >> +static void qtest_accel_cpu_init(void)
> >> +{
> >> +    if (qtest_enabled()) {
> >> +        cpus_register_accel(&qtest_cpus);
> >> +    }
> >> +}
> >> +
> >> +accel_cpu_init(qtest_accel_cpu_init);
> > 
> > I don't understand why this (and the similar changes on other
> > accelerators) is an improvement.
> > 
> > You are replacing a trivial AccelClass-specific init method with
> > a module_init() function that has a hidden dependency on runtime
> > state.
> > 
> 
> Not a big advantage I agree,
> I think however there is one, in using the existing framework that exists, for the purposes that it was built for.
> 
> As I understand it, the global module init framework is supposed to mark the major initialization steps,
> and this seems to fit the bill.

That seems to be the main source of disagreement.  I don't agree
that's the purpose of module_init().

The module init framework is used to unconditionally register
module-provided entities like option names, QOM types, block
drivers, trace events, etc.  The entities registered by module
init functions represent a passive dynamically loadable piece of
code.

module_init() was never used for initialization of machines,
devices, CPUs, or other runtime state.  We don't have
MODULE_INIT_MONITOR, MODULE_INIT_OBJECTS, MODULE_INIT_MACHINE,
MODULE_INIT_CPUS, MODULE_INIT_DEVICES, etc.

And I'm not convinced we should, because it would hide
dependencies between initialization steps.  It would force us to
make initialization functions affect and depend on global state.

I believe this:

  int main()
  {
    result_of_A = init_A(input_for_A);
    result_of_B = init_B(input_for_B);
    result_of_C = init_C(input_for_C);
  }

is clearer and more maintainable than:

  int main()
  {
    module_init_call(MODULE_INIT_A);  /* result_of_A hidden in global state */
    module_init_call(MODULE_INIT_B);  /* result_of_B hidden in global state */
    module_init_call(MODULE_INIT_C);  /* result_of_C hidden in global state */
  }

> 
> The "hidden" dependency on the fact that accels need to be initialized at that time, is not hidden at all I think,
> it is what this module init step is all about.
> 
> It is explicitly meaning, "_now that the current accelerator is chosen_, perform these initializations".
> 
> But, as you mentioned elsewhere, I will in the meantime anyway squash these things so they do not start fragmented at all, and centralize immediately.

Agreed.  We still need to sort out the disagreement above, or
we'll spend a lot of energy arguing about code.

-- 
Eduardo


