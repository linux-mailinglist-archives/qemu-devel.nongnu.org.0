Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C92297C21
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 13:35:59 +0200 (CEST)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWHq2-0000an-NM
	for lists+qemu-devel@lfdr.de; Sat, 24 Oct 2020 07:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kWHod-0008DD-Rd
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 07:34:31 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kWHob-0001wM-Rw
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 07:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=IosgWKWV9iWknWfbpJyo3ArbRwIB7FN1/3lzHqhDrfY=; b=S+F+fyfWGhgohhQUUqezIOwXeh
 oWhwX8xBEoXjU4RFVONHIP03Umt/azPYRgZhHXxRuhJi+AycC07O7gjv7MYRI9PJsAgdLrndNmtE+
 E94PFNdHZ8ErhrwSuiWn/VbOkyNw1ZnM6kXZqIBHaE5/6T2u3TDBwoiR2XmQp8XhLTMGbXk+S+pqY
 rnXXi3IHKWrxizL+jX/WjSxypGrO8bVBQCc8xB9j6tEZVPvu5mBHLoWGYIeDdvT2wGKTEqgzcSrkg
 7cbfwdOTV+BlGmJE6Iw8q6MKRDQlLLYfY9co/G34/K1NF66w9A48FnJdJjUsYT9g49aUgFxo95lIV
 TjZiNYwQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 05/12] tests/qtest/qos-test: dump qos graph if verbose
Date: Sat, 24 Oct 2020 13:34:26 +0200
Message-ID: <2472528.1CC7OQhuS2@silver>
In-Reply-To: <88899a4e-6d02-673c-fce8-41f8bf9f5224@redhat.com>
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
 <cd6975a177d3664b593861e94eb3027430523f31.1602182956.git.qemu_oss@crudebyte.com>
 <88899a4e-6d02-673c-fce8-41f8bf9f5224@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 06:39:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Samstag, 24. Oktober 2020 08:01:55 CEST Thomas Huth wrote:
> On 08/10/2020 20.34, Christian Schoenebeck wrote:
> > If qtests were run in verbose mode (i.e. if --verbose CL argument was
> > provided) then dump the generated qos graph (all nodes and edges,
> > along with their current individual availability status) to stdout.
> > 
> > See API doc comment on function qos_dump_graph() for details.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  tests/qtest/qos-test.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
> > index 8fdf87b183..d98ef78613 100644
> > --- a/tests/qtest/qos-test.c
> > +++ b/tests/qtest/qos-test.c
> > @@ -322,6 +322,9 @@ int main(int argc, char **argv)
> > 
> >      qos_set_machines_devices_available();
> >      
> >      qos_graph_foreach_test_path(walk_path);
> > 
> > +    if (g_test_verbose()) {
> > +        qos_dump_graph();
> > +    }
> > 
> >      g_test_run();
> >      qtest_end();
> >      qos_graph_destroy();
> 
> I'd squash this into the previous patch, so that it is clear there where the
> function gets used.
> 
>  Thomas

Sure, np.

Thanks for your feedback Thomas.

Best regards,
Christian Schoenebeck



