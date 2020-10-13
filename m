Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D9128CCA5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 13:37:36 +0200 (CEST)
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSIcZ-0007SM-Oo
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 07:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kSIZp-00055T-GF
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 07:34:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kSIZn-0002oa-Af
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 07:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602588882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwbVSL0QsXUnWyEdYHCSoU43fcqNvzh3eON4sMjZ54Y=;
 b=OuTh63FINq0lhk0h0v6L4B5H9P8Ty49vdxvP1RTgpn5Ls4SQ6KQZuUXyqlE5x4dHWSG2BJ
 xnewBqgM6t3u5TIVcBsF3heoYBI00h3xcLClstvOWJ9f2bykRU68ty+rSvTYaSDwGgXzWZ
 BnhYcJ93upKgo3c9mK84FyPOSmc+m1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-_O4dOh2PMQWYrDPPYGlW3Q-1; Tue, 13 Oct 2020 07:34:38 -0400
X-MC-Unique: _O4dOh2PMQWYrDPPYGlW3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B311964088;
 Tue, 13 Oct 2020 11:34:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AB9F5D9D2;
 Tue, 13 Oct 2020 11:34:32 +0000 (UTC)
Subject: Re: [PULL 00/15] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
References: <20201013065313.7349-1-laurent@vivier.eu>
 <CAFEAcA81HdRLh25MoC+=ZS7TERAzbZt_Ns+-Lp=oZFL69nMsoA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f22fbab6-9b09-341c-98c8-0832e29de1a5@redhat.com>
Date: Tue, 13 Oct 2020 13:34:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA81HdRLh25MoC+=ZS7TERAzbZt_Ns+-Lp=oZFL69nMsoA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/2020 13.06, Peter Maydell wrote:
> On Tue, 13 Oct 2020 at 07:56, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> The following changes since commit 2387df497b4b4bcf754eb7398edca82889e2ef54:
>>
>>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2020-10-10' int=
>> o staging (2020-10-12 11:29:42 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-request
>>
>> for you to fetch changes up to ef3a1d9fc36140f8933fbced70ee21fd9740b33c:
>>
>>   meson.build: drop duplicate 'sparc64' entry (2020-10-12 23:11:32 +0200)
>>
>> ----------------------------------------------------------------
>> Trivial Patches Pull request 20201013
>>
>> ----------------------------------------------------------------
> 
> Compile failure on ppc64be:
> 
> ../../hw/rtc/twl92230.c: In function ‘menelaus_rx’:
> ../../hw/rtc/twl92230.c:289:23: error: array subscript is above array
> bounds [-Werror=array-bounds]
>          return s->dcdc[addr - MENELAUS_VCORE_CTRL1];

Uh, oh, mea culpa, copy-n-paste error... that should have been
MENELAUS_DCDC_CTRL1 instead.
Laurent, could you fix it up, or shall I send a v2 of the patch?

 Thomas


