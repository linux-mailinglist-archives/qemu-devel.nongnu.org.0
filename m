Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72268409C5C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 20:35:51 +0200 (CEST)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPqo2-0007Sh-Hd
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 14:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPqhz-0004Bq-VD
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:29:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPqhy-0003vF-Cu
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631557773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gtPtorAwS3Kxmm82GzbgIFPCN3OkXmZAiGq2PdO/2ag=;
 b=LNzAdOL9ZJ06yoljmRmeSMv12Qdx9de+dMAflPYFZMPCkSiUDzTfdwwtduVng9o20O56zr
 rgHG5awRBI6H20adhEK5IaqPHUXfsvJlWJn11J7Vh32JIdJ/zy9oTCi731MvHQ+rU6Pehl
 rXe407nQz4IGr7Q1sbF1qXxzNdIC2/c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-VHKKDuj4PROflMODJigDbA-1; Mon, 13 Sep 2021 14:29:30 -0400
X-MC-Unique: VHKKDuj4PROflMODJigDbA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so5278402wma.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 11:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gtPtorAwS3Kxmm82GzbgIFPCN3OkXmZAiGq2PdO/2ag=;
 b=fE1+h50O0dESPF8tVwpd90iezdxZrraRMdtjfNcJb/IwPDlJ6Y5Dsm6kcBsrEoOixt
 MpjRkqZTOnp0QD64gFFVYRb/n61cbatD9MiKssmcQPqGp0PqJyaWztTYSBONZGKG8kMh
 KpMUBsMdkFzucrv6XicQfiTPi90NWFFhzHtNn6+T/X8+izZpDCWj10SMIGqMOY73VJD6
 UwscKSI92hUgtaQVMPrWcjr8oiElwBWGluqhjMj+jkWy61FL6Vvx+uXKzJPCBrlrxsbX
 tZjledCYhCsZ/VPuNUCe8s0E7k7YrFh/n8vb6Rp6hbSFRkIp7vHNJUylKtdDDYoOtiyY
 5Ycw==
X-Gm-Message-State: AOAM532/0ug1nY6L5PTpsr4skuQlN4dhYV5dx8Yyqm6U1oe1zVskkTWv
 y0mYYUxLcFfkcgTBy7j74J2dhy0fU1VcO4PMgcupypyxxNMKlWHf/4g0b75CppnF8iYdqWJyR7V
 E28TNPnNOYf9OS4wHOx96ecuK4dNUKw6RPE7JFD/Fgwqb8l5hm8cq+eYpX4LnYk5s
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr12583262wmd.36.1631557768791; 
 Mon, 13 Sep 2021 11:29:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx557TNu6jwn9TnWY9VlNuFFfS708S8s1h26hizzIbtMFfDddBjMxG6Emlm3cwz02pqN5VB+g==
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr12583237wmd.36.1631557768440; 
 Mon, 13 Sep 2021 11:29:28 -0700 (PDT)
Received: from x1w.redhat.com (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y15sm8634320wmi.18.2021.09.13.11.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 11:29:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Gemfile: Add webrick bundle dependency
Date: Mon, 13 Sep 2021 20:29:27 +0200
Message-Id: <20210913182927.1022862-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without the webrick bundle, jekyll fails to start:

  $ bundle exec jekyll serve
  Ignoring ffi-1.11.1 because its extensions are not built. Try: gem pristine ffi --version 1.11.1
  Configuration file: qemu-web/_config.yml
              Source: qemu-web
         Destination: qemu-web/_site
   Incremental build: disabled. Enable with --incremental
        Generating...
         Jekyll Feed: Generating feed for posts
                      done in 0.686 seconds.
   Auto-regeneration: enabled for 'qemu-web'
                      ------------------------------------------------
        Jekyll 4.0.1   Please append `--trace` to the `serve` command
                       for any additional information or backtrace.
                      ------------------------------------------------
  qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve/servlet.rb:3:in `require': cannot load such file -- webrick (LoadError)
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve/servlet.rb:3:in `<top (required)>'
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:179:in `require_relative'
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:179:in `setup'
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:100:in `process'
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `block in process_with_graceful_fail'
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `each'
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `process_with_graceful_fail'
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:86:in `block (2 levels) in init_with_program'
          from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `block in execute'
          from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `each'
          from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `execute'
          from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/program.rb:42:in `go'
          from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary.rb:19:in `program'
          from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/exe/jekyll:15:in `<top (required)>'

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Gemfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Gemfile b/Gemfile
index 6a7852e..dc35cb7 100644
--- a/Gemfile
+++ b/Gemfile
@@ -25,3 +25,5 @@ end
 
 # for https://github.com/sass/sassc-ruby/issues/146
 gem "sassc", ">= 2.2.1"
+
+gem "webrick", "~> 1.7"
-- 
2.31.1


