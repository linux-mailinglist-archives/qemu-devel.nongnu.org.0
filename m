Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC922EC6E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 14:45:38 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k02Vd-0004XZ-Bl
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 08:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k02UD-0003bw-6L
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:44:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48635
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k02UA-0000hT-M8
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595853846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8UktG/rL55bXgnNPU45pe0OjKIi67+A/EjE2HdLjkX0=;
 b=Lnb3uOdiof0SgYj/vfCglUrrKwE8C/N+rNrwSMdOe4Yf93NauY2MpJ/hhufZ3j+TUPfouI
 E04t6cqA46YA8tmDBpo4OBWaS6GAjQLavoEWv+mdHqDvieF6ABPV2PEZwOa6t3DAG2KOPN
 Fsl4ab3VnkOYJC5fm319n+7TyCQSv3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-tulNhLGzPa-jaJ4AJvsSqg-1; Mon, 27 Jul 2020 08:44:04 -0400
X-MC-Unique: tulNhLGzPa-jaJ4AJvsSqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14E558017FB;
 Mon, 27 Jul 2020 12:44:01 +0000 (UTC)
Received: from gondolin (ovpn-112-210.ams2.redhat.com [10.36.112.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C963712D8;
 Mon, 27 Jul 2020 12:43:52 +0000 (UTC)
Date: Mon, 27 Jul 2020 14:43:50 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [RFC PATCH v3 8/8] target/s390x: Use start-powered-off CPUState
 property
Message-ID: <20200727144350.47abd7e7.cohuck@redhat.com>
In-Reply-To: <20200723025657.644724-9-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-9-bauerman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 00:16:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Jul 2020 23:56:57 -0300
Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:

> Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Note that this changes behavior by setting cs->halted to 1 on reset, which
> didn't happen before.

I think that should be fine, as we change the cpu state to STOPPED in
the reset function, which sets halted to 1.

> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  target/s390x/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.

No noticeable difference under kvm, but running under tcg seems a bit
more sluggish than usual, and I saw some pausing on reboot (after the
bios handover to the kernel). Not sure if it were just flukes on my
laptop, would appreciate if someone else could give it a go.

> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 08eb674d22..73d7d6007e 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -291,7 +291,7 @@ static void s390_cpu_initfn(Object *obj)
>      S390CPU *cpu = S390_CPU(obj);
>  
>      cpu_set_cpustate_pointers(cpu);
> -    cs->halted = 1;
> +    cs->start_powered_off = true;
>      cs->exception_index = EXCP_HLT;
>  #if !defined(CONFIG_USER_ONLY)
>      object_property_add(obj, "crash-information", "GuestPanicInformation",
> 


