Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A316C3CF4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 22:45:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pejlo-0005hr-5f; Tue, 21 Mar 2023 17:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pejlc-0005h9-BS
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 17:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pejla-0000oa-NX
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 17:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679435015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVDih0PH4hb6i02KBCosDeCNytNuKtUJi41V045I5LE=;
 b=MabK5BMQoQQkd0yHkm1pdhBcssbtknErM0X5bJGnV7Ytz34jX0IzqmcEKlAWJApQqRstOG
 6XVDPn93cWEf5pWPjasZhKqSXu0IJCxFk+CfGYgFt7jNHHRomktpefeot847wNSIzVkQ2r
 b4k/Q5QS1nRJwCEzost4wEWfRbweAB4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-cNqzDWFbOui0hDnsdOPEng-1; Tue, 21 Mar 2023 17:43:31 -0400
X-MC-Unique: cNqzDWFbOui0hDnsdOPEng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFCC91C041AB;
 Tue, 21 Mar 2023 21:43:30 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A82F52166B29;
 Tue, 21 Mar 2023 21:43:29 +0000 (UTC)
Date: Tue, 21 Mar 2023 16:43:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
Message-ID: <20230321214327.xgxyvm2iw7pkiogz@redhat.com>
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
 <87cz58ubcn.fsf@pond.sub.org> <ZBMfosr0JDyfjhqs@redhat.com>
 <873564spze.fsf@pond.sub.org>
 <aad2628c-196a-3f91-d184-20c034518de7@linaro.org>
 <ZBnLAIXT3pTmjqAy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBnLAIXT3pTmjqAy@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 21, 2023 at 03:19:28PM +0000, Daniel P. Berrangé wrote:
> On Tue, Mar 21, 2023 at 03:31:56PM +0100, Philippe Mathieu-Daudé wrote:
> > On 16/3/23 15:57, Markus Armbruster wrote:
> > > Daniel P. Berrangé <berrange@redhat.com> writes:
> > > 
> > > > On Thu, Mar 16, 2023 at 01:31:04PM +0100, Markus Armbruster wrote:
> > > > > Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> > > > > 
> > > > > > Per the C++ standard, empty enum are ill-formed. Do not generate
> > > 
> > > The C standard.  The C++ standard doesn't apply here :)
> > 
> > I can't find how empty enums are considered by the C standard...
> 
> The C standard doesn't really matter either.
> 
> What we actually care about is whether GCC and CLang consider the
> empty enums to be permissible or not. or to put it another way...
> if it compiles, ship it :-)

But it doesn't compile:

$ cat foo.c
typedef enum Blah {
} Blah;
int main(void) {
  Blah b = 0;
}
$ gcc -o foo -Wall foo.c
foo.c:2:1: error: empty enum is invalid
    2 | } Blah;
      | ^
foo.c: In function ‘main’:
foo.c:4:5: error: unknown type name ‘Blah’; use ‘enum’ keyword to refer to the type
    4 |     Blah b = 0;
      |     ^~~~
      |     enum 
foo.c:4:10: warning: unused variable ‘b’ [-Wunused-variable]
    4 |     Blah b = 0;
      |          ^

So we _do_ need to avoid creating an enum with all members optional in
the configuration where all options are disabled, if we want that
configuration to compile.  Or require that all QAPI enums have at
least one non-optional member.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


