Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B16A82F0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:57:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiTY-0003ZB-72; Thu, 02 Mar 2023 07:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pXiTD-0003IT-6A
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:55:41 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pXiT7-00054q-E5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:55:38 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED70A1FE6D;
 Thu,  2 Mar 2023 12:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677761726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C3ZKipHeBw2cLW36H/cj7pto0EjtkEk84LPJgfE9WaY=;
 b=qwxTRLgkTfnpM+ftp58G8eoz84RrPzw1UZKju0JxRIILad2NhTL2hEYiliLZ+Cdk3ZISUe
 EZqVHSycLoAhzp9rtWZ1eIU8+5gkS/yKjN80oqm50ATDMlrMrtoc1SZjIkIOFQgByKlDex
 ozUcE3udP139PIQi7EFUqKJynmKQCCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677761726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C3ZKipHeBw2cLW36H/cj7pto0EjtkEk84LPJgfE9WaY=;
 b=W145sNsZWz5UNhjx1crJjwxtAKhUmSkjl3Y/vNckcEvtws6oiTZUG5SqwcgQPeSdYN/ZRN
 aqP59gxGb/g3hyDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DE9B13349;
 Thu,  2 Mar 2023 12:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ynAyEr6cAGQnMAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 02 Mar 2023 12:55:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, berrange@redhat.com,
 thuth@redhat.com
Subject: Re: [PATCH 14/33] tests: acpi: update expected blobs
In-Reply-To: <20230302130251.4ef53268@imammedo.users.ipa.redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
 <20230224153812.4176226-15-imammedo@redhat.com>
 <20230301192428-mutt-send-email-mst@kernel.org>
 <20230302130251.4ef53268@imammedo.users.ipa.redhat.com>
Date: Thu, 02 Mar 2023 09:55:24 -0300
Message-ID: <87a60vwbwj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Igor Mammedov <imammedo@redhat.com> writes:

> On Wed, 1 Mar 2023 19:27:33 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
>> On Fri, Feb 24, 2023 at 04:37:53PM +0100, Igor Mammedov wrote:
>> > only following context change:
>> >  -  Local1 = Zero
>> >     If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>> >     {
>> >         Return (Local0)
>> >  ...
>> >         Return (Local0)
>> >     }
>> > 
>> >  +  Local1 = Zero
>> >     Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
>> > 
>> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
>> 
>> Nope:
>> 
>> diff -ru -N -IDisassembly -IChecksum '-I*     Length           ' old/asl/tests/data/acpi/q35/DSDT.viot.dsl new/asl/tests/data/acpi/q35/DSDT.viot.dsl
>> :--- old/asl/tests/data/acpi/q35/DSDT.viot.dsl  2023-03-01 19:22:57.636454958 -0500
>> :+++ new/asl/tests/data/acpi/q35/DSDT.viot.dsl  2023-03-01 19:22:58.451460462 -0500
>> :@@ -148,7 +148,6 @@
>>                      {
>>                           0x00                                             // .
>>                      }
>> -                Local1 = Zero
>>                  If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>>                  {
>>                      Return (Local0)
>> :@@ -159,12 +158,14 @@
>>                      Return (Local0)
>>                  }
>>  
>> +                Local1 = Zero
>>                  Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
>>                      ))
>>                  If (!((Local2 == Zero) | (Local2 == 0xFFFFFFFF)))
>>                  {
>>                      Local1 |= One
>>                      Local1 |= (One << 0x07)
>> +                    Local1 |= (One << 0x05)
>>                  }
>>  
>>                  Local0 [Zero] = Local1
>> 
>> 
>> and the funny thing is, the second change is in the expected
>> file but not in the code so this patch causes the test to fail.
>
> above diff is remnants of some old version of the patch before
> patches were reshuffled.
>
> for some reason q35/viot test gets skipped => no table rebuild => stale DSDT.viot table
>
> reverting recently merged commit c471eb4f40, I can get q35/viot test back:
>
> commit c471eb4f40445908c1be7bb11a37ac676a0edae7
> Author: Fabiano Rosas <farosas@suse.de>
> Date:   Wed Feb 8 16:46:57 2023 -0300
>
>     tests/qtest: Check for devices in bios-tables-test
>
> so checks aren't working as expected on my host for some reason
>

Was this a legitimate skip or do we have a bug in the way we check for
devices? I.e. did you have CONFIG_VIRTIO_IOMMU in the build?

If we avoid the checks during rebuild and a device is not present in the
build anyway, then that QEMU invocation would crash.




