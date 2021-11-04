Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B764E4450E9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 10:10:19 +0100 (CET)
Received: from localhost ([::1]:43016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYlF-0001Pz-0f
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 05:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miYiY-00084I-Rm
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 05:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miYiW-0004sz-Gc
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 05:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BrWTL4C3dO5o4IGDuvpkoLNetiFXQeck5cmjf+8y5E=;
 b=GfsMvA6MVQ1qRk5Gcp5dAKXgrsaPwm8kTFshzwmC/INqzNvA4LU2si5vznGlgeX35R56lA
 SVBtl/FMDY9MCkUPZyBqwhli8QwJYlG1R1jTnKyD7wHBHc13Mbm9MWI26z/E+ds4aeSmej
 Xo8/pbQSe1GWsEqAa8Xb6XR4mF4arvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-WmaZRR9YNIiekM4ByMKToA-1; Thu, 04 Nov 2021 05:07:25 -0400
X-MC-Unique: WmaZRR9YNIiekM4ByMKToA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33404112B8C0
 for <qemu-devel@nongnu.org>; Thu,  4 Nov 2021 09:07:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE118A6C44;
 Thu,  4 Nov 2021 09:07:22 +0000 (UTC)
Date: Thu, 4 Nov 2021 10:07:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
Message-ID: <YYOiyTcA6zZgtWBs@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: armbru@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.11.2021 um 22:26 hat Paolo Bonzini geschrieben:
> On 11/3/21 18:29, Kevin Wolf wrote:
> > This series adds QOM class definitions to the QAPI schema, introduces
> > a new TypeInfo.instance_config() callback that configures the object at
> > creation time (instead of setting properties individually) and is
> > separate from runtime property setters (which often used to be not
> > really tested for runtime use), and finally generates a marshalling
> > function for .instance_config() from the QAPI schema that makes this a
> > natural C interface rather than a visitor based one.
> 
> That's pretty cool!
> 
> Just one question: why not always use boxed configuration?  It should not
> make the instance_config types any larger, and it avoids unwieldy argument
> lists.

Basically for the same reason as for commands (and for consistency with
commands): If you have only one or two options, then creating a separate
type for them feels just a little over the top, and boxing doesn't work
with implicit types.

I really like the concise definitions without a separate struct like in:

{ 'class': 'rng-egd',
  'parent': 'rng-backend',
  'config': { 'chardev': 'str' } }

Though maybe we could make it work by giving the implicit type another
prefixed name?

> Also, for the obligatory bikeshedding remark, do you have any other plans or
> ideas for the colon-separated auto generated typenames?  Having both the
> "namespace" (qom) and the more specific use (config) before the classname is
> a bit weird, compared to the existing structs like RngRandomProperties.
> Especially if boxed config is more used (or becomes the only possibility),
> it might be that qom:class-name:config, or even just class-name:config, make
> for nicer code in the object implementation.

'qom-config:classname' isn't a type that is useful for the object
implementations at all. Its only use is really storing the whole
configuration temporarily in a QAPI C struct before applying it.

The class implementations always want to store only their "local" config
options, but 'qom-config:classname' contains those of the parent class
as well.

In my example conversion, I left RngProperties as a separate type that
is just referenced in the class definition:

{ 'class': 'rng-backend',
  'config': 'RngProperties' }

This is what you would do when rng-backend wants to store its options in
a single struct, and then it's still RngProperties.

As for the naming, I chose a prefix because I think QOM doesn't restrict
the characters used in class names, so suffixes could become ambiguous.
The colon is just a character that is invalid in QAPI user types and
looked nice to me, any other reserved character would do.

Oh, and I also wanted to say something about why not just directly using
the class name, which was my first idea: 'foo': 'iothread' looks more
like referencing an existing iothread rather than the configuration for
a new one. I wanted to leave us the option that we could possibly later
take a string for such options (a QOM path) and then pass the referenced
object to QMP commands as the proper QOM type.

(Maybe there aren't currently many commands that take specific QOM
objects, but I'm dreaming of a future state with QMP commands that take
'block-node' arguments etc.)

Kevin


