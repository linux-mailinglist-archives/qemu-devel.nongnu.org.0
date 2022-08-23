Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E279B59E407
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 15:09:27 +0200 (CEST)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQTeo-0004qu-J2
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 09:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQTWK-0006zl-J4
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 09:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQTWH-000266-8y
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 09:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661259636;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHfjKaO53yGlJX+XLvo/didr1PVO1rluVXcMFKA3naE=;
 b=CpH0qYOkugEgXkIp+fiiuZveCU0euem1OWsewHWOilcI+skHtQ6EPYM/odVcV5OXv1ooaC
 cHKlIYyqneh/lj+xUZutrmFwALRStb9lp2fnG1OmS38jpFy5uLggEwFkwt4cHfelYW2Duz
 11Xcvrt3Q8DWQwakWY8bXbaLsMT1+Jc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-bhxCAC4eN-OwvTW2dZRjng-1; Tue, 23 Aug 2022 09:00:26 -0400
X-MC-Unique: bhxCAC4eN-OwvTW2dZRjng-1
Received: by mail-wm1-f72.google.com with SMTP id
 j3-20020a05600c1c0300b003a5e72421c2so648090wms.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 06:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=ZHfjKaO53yGlJX+XLvo/didr1PVO1rluVXcMFKA3naE=;
 b=XNqim4H/mRUzBY5at46/3H1kbEouJG0D8nEltblHQ2lmDwCgb09wIne4JVUKjYFqk/
 kmRhhVFjfwSDhljHbmNsEmga6CV79PI8EN8kVmKLYgVx7Bs1wmqjzfJEMo19rIpOrsbI
 pYkvvhHBIhMMgMvuexzjQ9EY585ov9hm9Xb/HBR3L3Z3vqfOaNORsoVSw+oGRzEiyb6r
 sTnJQiDODIf8T33WDWK+P3TFR/uDyKrq5MFbEe0lp0iQ/1EYNnLBpyu+bxXkvHzwmJ+p
 +BrYT3j7LaQqimNN2dT1hFpJo+iDoO/smEapLr9ie7/yURP6hbBGotwNvgMD/bQWuiDW
 9H7A==
X-Gm-Message-State: ACgBeo2R1kajT0Ji9RHJU9po5253em4xBFTIa7Bx/1zej66Vc+ZGW+P4
 KIJPAIJJW26odCqvHI2/2mIdZ7O2+OXVQO8wRfbEPSpDSrt1BRROZQ1KR8ZoWlsw1QBb/aeaeO5
 vCjMfB1JyI3g5hi0=
X-Received: by 2002:adf:f28a:0:b0:225:2a40:1cbe with SMTP id
 k10-20020adff28a000000b002252a401cbemr13665119wro.257.1661259625651; 
 Tue, 23 Aug 2022 06:00:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7KXImN+RgwRjXQL7IILPdPiTlKoInh28EMdSTMW2b4QB8qtnljCrOdP+iR6TjfmCA0W8imrA==
X-Received: by 2002:adf:f28a:0:b0:225:2a40:1cbe with SMTP id
 k10-20020adff28a000000b002252a401cbemr13665099wro.257.1661259625419; 
 Tue, 23 Aug 2022 06:00:25 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 z6-20020a1cf406000000b003a2f2bb72d5sm24799891wma.45.2022.08.23.06.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 06:00:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Yanan
 Wang <wangyanan55@huawei.com>,  Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v7 06/12] multifd: Make flags field thread local
In-Reply-To: <CAJ6HWG7hXM8jwLTqTZx_uyWm0KKBC93wVgrXV_dcC_r+HwKmPw@mail.gmail.com>
 (Leonardo Bras Soares Passos's message of "Sat, 20 Aug 2022 04:24:54
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-7-quintela@redhat.com>
 <ef7bff6220e3759c7acb5382ae211de1623cdf5e.camel@redhat.com>
 <87czcw1rfp.fsf@secure.mitica>
 <CAJ6HWG7hXM8jwLTqTZx_uyWm0KKBC93wVgrXV_dcC_r+HwKmPw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 23 Aug 2022 15:00:24 +0200
Message-ID: <87h723yv13.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> On Fri, Aug 19, 2022 at 7:03 AM Juan Quintela <quintela@redhat.com> wrote:
>>
>> Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
>> > On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
>> >> Use of flags with respect to locking was incensistant.  For the
>> >> sending side:
>> >> - it was set to 0 with mutex held on the multifd channel.
>> >> - MULTIFD_FLAG_SYNC was set with mutex held on the migration thread.
>> >> - Everything else was done without the mutex held on the multifd chan=
nel.
>> >>
>> >> On the reception side, it is not used on the migration thread, only on
>> >> the multifd channels threads.
>> >>
>> >> So we move it to the multifd channels thread only variables, and we
>> >> introduce a new bool sync_needed on the send side to pass that inform=
ation.
>> >>
>> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> >> ---
>> >>  migration/multifd.h | 10 ++++++----
>> >>  migration/multifd.c | 23 +++++++++++++----------
>> >>  2 files changed, 19 insertions(+), 14 deletions(-)
>> >>
>> >> diff --git a/migration/multifd.h b/migration/multifd.h
>> >> index 36f899c56f..a67cefc0a2 100644
>> >> --- a/migration/multifd.h
>> >> +++ b/migration/multifd.h
>> >> @@ -98,12 +98,12 @@ typedef struct {
>> >
>> > Just noticed having no name in 'typedef struct' line makes it harder to
>> > understand what is going on.
>>
>> It is common idiom in QEMU.  The principal reason is that if you don't
>> want anyone to use "struct MultiFDSendParams" but MultiFDSendParams, the
>> best way to achieve that is to do it this way.
>
> I agree, but a comment after the typedef could help reviewing. Something =
like
>
> typedef struct { /* MultiFDSendParams */
> ...
> } MultiFDSendParams

You have a point here.  Not putting a comment, putting the real thing.

Thanks, Juan.


