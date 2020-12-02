Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FB2CB909
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:38:08 +0100 (CET)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOaN-0002jJ-7e
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDS-00046x-J2
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCe-0003rN-13
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Hqr6mt+EekxiJYbciaRspwkwPYDs2CfXQtqWsJjinE=;
 b=NiavDD5BiJrwnZIj0yYR5My+OMEOBZqza7vbMxOv1vqLF192RnGricTUz2lOO03FJFKUYA
 OBS9gsfC+CZXSqxNAECfXlLnZzKk8v97AcCeVVHNlrhL3S0X2LTKprPLpeHOoEfeXlcCtB
 itCIKyBtMzQ20kfeGIQGws3GdAE1TuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-Q98QdPBhNmuLmR-0MPIJgw-1; Wed, 02 Dec 2020 03:09:29 -0500
X-MC-Unique: Q98QdPBhNmuLmR-0MPIJgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB7025708C
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F80160854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:28 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 103/113] scripts: kernel-doc: don't mangle with parameter list
Date: Wed,  2 Dec 2020 03:08:39 -0500
Message-Id: <20201202080849.4125477-104-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While kernel-doc needs to parse parameters in order to
identify its name, it shouldn't be touching the type,
as parsing it is very difficult, and errors happen.

One current error is when parsing this parameter:

	const u32 (*tab)[256]

Found at ./lib/crc32.c, on this function:

	u32 __pure crc32_be_generic (u32 crc, unsigned char const *p, size_t len, const u32 (*tab)[256], u32 polynomial);

The current logic mangles it, producing this output:

	const u32 ( *tab

That's something that it is not recognizeable.

So, instead, let's push the argument as-is, and use it
when printing the function prototype and when describing
each argument.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-22-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0c31e9ad66..478037f736 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -655,10 +655,10 @@ sub output_function_man(%) {
 	$type = $args{'parametertypes'}{$parameter};
 	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
 	    # pointer-to-function
-	    print ".BI \"" . $parenth . $1 . "\" " . $parameter . " \") (" . $2 . ")" . $post . "\"\n";
+	    print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" . $post . "\"\n";
 	} else {
 	    $type =~ s/([^\*])$/$1 /;
-	    print ".BI \"" . $parenth . $type . "\" " . $parameter . " \"" . $post . "\"\n";
+	    print ".BI \"" . $parenth . $type . "\" " . " \"" . $post . "\"\n";
 	}
 	$count++;
 	$parenth = "";
@@ -929,7 +929,7 @@ sub output_function_rst(%) {
 	    # pointer-to-function
 	    print $1 . $parameter . ") (" . $2 . ")";
 	} else {
-	    print $type . " " . $parameter;
+	    print $type;
 	}
     }
     if ($args{'typedef'}) {
@@ -954,7 +954,7 @@ sub output_function_rst(%) {
 	$type = $args{'parametertypes'}{$parameter};
 
 	if ($type ne "") {
-	    print "``$type $parameter``\n";
+	    print "``$type``\n";
 	} else {
 	    print "``$parameter``\n";
 	}
@@ -1479,7 +1479,7 @@ sub create_parameterlist($$$$) {
 	    # Treat preprocessor directive as a typeless variable just to fill
 	    # corresponding data structures "correctly". Catch it later in
 	    # output_* subs.
-	    push_parameter($arg, "", $file);
+	    push_parameter($arg, "", "", $file);
 	} elsif ($arg =~ m/\(.+\)\s*\(/) {
 	    # pointer-to-function
 	    $arg =~ tr/#/,/;
@@ -1488,7 +1488,7 @@ sub create_parameterlist($$$$) {
 	    $type = $arg;
 	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
 	    save_struct_actual($param);
-	    push_parameter($param, $type, $file, $declaration_name);
+	    push_parameter($param, $type, $arg, $file, $declaration_name);
 	} elsif ($arg) {
 	    $arg =~ s/\s*:\s*/:/g;
 	    $arg =~ s/\s*\[/\[/g;
@@ -1513,26 +1513,28 @@ sub create_parameterlist($$$$) {
 	    foreach $param (@args) {
 		if ($param =~ m/^(\*+)\s*(.*)/) {
 		    save_struct_actual($2);
-		    push_parameter($2, "$type $1", $file, $declaration_name);
+
+		    push_parameter($2, "$type $1", $arg, $file, $declaration_name);
 		}
 		elsif ($param =~ m/(.*?):(\d+)/) {
 		    if ($type ne "") { # skip unnamed bit-fields
 			save_struct_actual($1);
-			push_parameter($1, "$type:$2", $file, $declaration_name)
+			push_parameter($1, "$type:$2", $arg, $file, $declaration_name)
 		    }
 		}
 		else {
 		    save_struct_actual($param);
-		    push_parameter($param, $type, $file, $declaration_name);
+		    push_parameter($param, $type, $arg, $file, $declaration_name);
 		}
 	    }
 	}
     }
 }
 
-sub push_parameter($$$$) {
+sub push_parameter($$$$$) {
 	my $param = shift;
 	my $type = shift;
+	my $org_arg = shift;
 	my $file = shift;
 	my $declaration_name = shift;
 
@@ -1596,8 +1598,8 @@ sub push_parameter($$$$) {
 	# "[blah" in a parameter string;
 	###$param =~ s/\s*//g;
 	push @parameterlist, $param;
-	$type =~ s/\s\s+/ /g;
-	$parametertypes{$param} = $type;
+	$org_arg =~ s/\s\s+/ /g;
+	$parametertypes{$param} = $org_arg;
 }
 
 sub check_sections($$$$$) {
-- 
2.26.2



