Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B691E269E78
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 08:28:34 +0200 (CEST)
Received: from localhost ([::1]:38022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI4S9-0005UT-RC
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 02:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kI4RG-0004pl-VP
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 02:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kI4RF-0005bh-Ct
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 02:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600151256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8AdB452kff1INhzPkhLt6QoWlRLjwwjHZvHrNxQULo=;
 b=Y9U1uoazxuJaa6oFxEnu539ZYUUh7NNhdfqe4Z/unBr4vyeL+rQJrLWm2Z4wvDmUiwUAQU
 MjYp9KvK2TKb0DimX4mA/liQAFfYB999CrAr+PsKbgnOZ5gcPY5poHCUlDny26BgPj8lIQ
 ymsKVJGx1XunAPofEn4FtY+tuEPgoK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-oes8mQ--PmaUplEJl72Sgg-1; Tue, 15 Sep 2020 02:27:32 -0400
X-MC-Unique: oes8mQ--PmaUplEJl72Sgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A34611007460;
 Tue, 15 Sep 2020 06:27:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6679E10021AA;
 Tue, 15 Sep 2020 06:27:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D95E5113864A; Tue, 15 Sep 2020 08:27:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 1/8] qapi: Restrict LostTickPolicy enum to machine code
References: <20200913195348.1064154-1-philmd@redhat.com>
 <20200913195348.1064154-2-philmd@redhat.com>
 <871rj4u3ct.fsf@dusky.pond.sub.org>
 <d80894ba-9958-48e6-33cc-6356474fc2b7@redhat.com>
Date: Tue, 15 Sep 2020 08:27:29 +0200
In-Reply-To: <d80894ba-9958-48e6-33cc-6356474fc2b7@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 14 Sep 2020 11:37:07
 +0200")
Message-ID: <87r1r3imge.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:23:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> +Laurent + qemu-block@
>
> On 9/14/20 11:14 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Acked-by: Markus Armbruster <armbru@redhat.com>
>>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>=20
>> Unlike the other patches that move code out of misc.json, this one
>> doesn't say "allows pulling less declarations/definitions to user-mode."
>> Intentional?
>
> TBH I don't remember as this is 6months old.
>
> IIUC the "tick lost" feature is only meaningful when running
> virtualized with a RTC profile, so this is pointless for
> user-mode binaries and tools.

Your reply to my question on PATCH 3 "What exactly is being pulled
where before the series, and no more afterwards?" leads me to believe
this patch is no different.  Suggest to add the same rationale to this
commit message.


