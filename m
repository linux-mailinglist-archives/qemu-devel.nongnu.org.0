Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338493D2665
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:09:21 +0200 (CEST)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aK8-0005Mm-A2
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6aJH-0004cr-6A
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6aJE-0000kW-Jh
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626966503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0m0QsIMuKnuZVy9nifjTPrpUhyUm3y9vmuQkSjVO6s=;
 b=OWSbsHXN30lO7w8Ueec/m03RMQBiOUBdvXlYiHCcn9D4QGW0jlRt0YJlYI4Le/BFXhOqbV
 Y82GhXTuXmwjXSIxQf+JZcZXoFZS4ujzFQOemrKZTI0QgIth0NmsxfAI2q5KZxq3JTnkIr
 27MjOw+1sp7KkLTERr8EL0RJS6M9eFw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-myfz_o2lPii13p7zcTQpWw-1; Thu, 22 Jul 2021 11:08:22 -0400
X-MC-Unique: myfz_o2lPii13p7zcTQpWw-1
Received: by mail-ej1-f72.google.com with SMTP id
 q8-20020a170906a088b02904be5f536463so1944432ejy.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y0m0QsIMuKnuZVy9nifjTPrpUhyUm3y9vmuQkSjVO6s=;
 b=YLtC4R57QvnlO4FMUMPmGlJ/nwW/FaqWQXNspykpGucZtUWsCO6kdetPx7eow5l6aU
 uQIk94CLkUd2rWPw7v57ZuD+5NqfGv2NbKrF8l6T3dwaKORrMIY6G1KNBWkI1c3Ge77L
 xkgHUJjrpcqvgsaIGg2yKdyUsl5+iXaXuKSDYj+oYK44vzolyrfSeljjcWXw/MY1rjpk
 e7EsFdxaeuHyhIgbdFvgFHwSXQuArVY6hsqFW476upGbd1h5WOorjGLZVQIYnEnMM98E
 uBQlvmDkA9SO3i9S0FSvxQX6WDJ1HBvVD9rCT2l0J1lGH3/O40jk8/zpq2cP8833r0OC
 85xw==
X-Gm-Message-State: AOAM533wFb/y4NEHfF+kAZBswk2wa8Tvd9UEjKMm1HhZZncSZRUOPah2
 xPLYJDt6b8V1WjiiCfQYzCz+nWd1r0dMo4XiPm06LSJ6/jrDJJvPpN3mVp5wEGH44Xw5Qpu7pVb
 7jz1pl7Y8CCX4IIJSORpe/2kAmSEc00hZ5EyY82JYPj7F605HjEuOlCWjvlrvkMOY+3I=
X-Received: by 2002:a17:906:d10c:: with SMTP id
 b12mr319182ejz.395.1626966500836; 
 Thu, 22 Jul 2021 08:08:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU+lDzDxMMPDZn2/eFJgn+9cwYhxspoJHKoq13QwZZWZ/TP/adH7qOOaIgVeNgCQx65XJh0w==
X-Received: by 2002:a17:906:d10c:: with SMTP id
 b12mr319158ejz.395.1626966500537; 
 Thu, 22 Jul 2021 08:08:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g8sm12891096eds.25.2021.07.22.08.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 08:08:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] qapi: introduce forwarding visitor
To: Markus Armbruster <armbru@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-2-pbonzini@redhat.com>
 <87v952fnut.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3426ca4c-fc26-1730-76f8-c46bc7fddca3@redhat.com>
Date: Thu, 22 Jul 2021 17:08:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87v952fnut.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/21 16:02, Markus Armbruster wrote:
> Double-checking: the other fields are not accessible via this visitor.
> Correct?

Correct.

>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   include/qapi/forward-visitor.h    |  27 +++
>>   qapi/meson.build                  |   1 +
>>   qapi/qapi-forward-visitor.c       | 307 ++++++++++++++++++++++++++++++
>>   tests/unit/meson.build            |   1 +
>>   tests/unit/test-forward-visitor.c | 165 ++++++++++++++++
>>   5 files changed, 501 insertions(+)
>>   create mode 100644 include/qapi/forward-visitor.h
>>   create mode 100644 qapi/qapi-forward-visitor.c
>>   create mode 100644 tests/unit/test-forward-visitor.c
> 
> Missing: update of the big comment in include/qapi/visitor.h.  Can be
> done on top.

Also because I'm not sure what to add. :)

This is not a fifth type of visitor, it's a wrapper for the existing types (two of them, input and output; the other two don't break horribly but make no sense either).

>> +static bool forward_field_translate_name(ForwardFieldVisitor *v, const char **name,
>> +                                         Error **errp)
>> +{
>> +    if (v->depth) {
>> +        return true;
>> +    }
> 
> Succeed when we're in a sub-struct.
> 
>> +    if (g_str_equal(*name, v->from)) {
>> +        *name = v->to;
>> +        return true;
>> +    }
> 
> Succeed when we're in the root struct and @name is the alias name.
> Replace the alias name by the real one.
> 
>> +    error_setg(errp, QERR_MISSING_PARAMETER, *name);
>> +    return false;
> 
> Fail when we're in the root struct and @name is not the alias name.
> 
>> +}
> 
> Can you explain why you treat names in sub-structs differently than
> names other than the alias name in the root struct?

Taking the example of QOM alias properties, if the QOM property you're
aliasing is a struct, its field names are irrelevant.  The caller may
not even know what they are, as they are not part of the namespace (e.g.
the toplevel QDict returned by keyval_parse) that is being modified.

There are no aliased compound QOM properties that I can make a proper example with, unfortunately.

>> +    /*
>> +     * The name of alternates is reused when accessing the content,
>> +     * so do not increase depth here.
>> +     */
> 
> I understand why you don't increase @depth here (same reason
> qobject-input-visitor.c doesn't qobject_input_push() here).  I don't
> understand the comment :)

See above: the alternate is not a struct; the names that are passed
between start_alternate and end_alternate are within the same namespace
as the toplevel field.

As to the comment, the idea is: if those calls used e.g. name == NULL,
the depth would need to be increased, but the name will be the same one
that was received by start_alternate.  Change to "The name passed to
start_alternate is also used when accessing the content"?

>> +Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to)
>> +{
>> +    ForwardFieldVisitor *v = g_new0(ForwardFieldVisitor, 1);
>> +
>> +    v->visitor.type = target->type;
> 
> Do arbitrary types work?  Or is this limited to input and output
> visitors?

They don't crash, but they don't make sense because 1) they should not
live outside qapi_clone and visit_free_* 2) they use NULL for the
outermost name.

> Not forwarded: method .type_size().  Impact: visit_type_size() will call
> the wrapped visitor's .type_uint64() instead of its .type_size().  The
> two differ for the opts visitor, the keyval input visitor, the string
> input visitor, and the string output visitor.

Fixed, of course.  Incremental diff after my sig.

Paolo

diff --git a/qapi/qapi-forward-visitor.c b/qapi/qapi-forward-visitor.c
index f04f72f66d..a4b111e22a 100644
--- a/qapi/qapi-forward-visitor.c
+++ b/qapi/qapi-forward-visitor.c
@@ -57,6 +57,7 @@ static bool forward_field_translate_name(ForwardFieldVisitor *v, const char **na
  static bool forward_field_check_struct(Visitor *v, Error **errp)
  {
      ForwardFieldVisitor *ffv = to_ffv(v);
+
      return visit_check_struct(ffv->target, errp);
  }
  
@@ -78,6 +79,7 @@ static bool forward_field_start_struct(Visitor *v, const char *name, void **obj,
  static void forward_field_end_struct(Visitor *v, void **obj)
  {
      ForwardFieldVisitor *ffv = to_ffv(v);
+
      assert(ffv->depth);
      ffv->depth--;
      visit_end_struct(ffv->target, obj);
@@ -132,8 +134,8 @@ static bool forward_field_start_alternate(Visitor *v, const char *name,
          return false;
      }
      /*
-     * The name of alternates is reused when accessing the content,
-     * so do not increase depth here.
+     * The name passed to start_alternate is used also in the visit_type_* calls
+     * that retrieve the alternate's content; so, do not increase depth here.
       */
      return visit_start_alternate(ffv->target, name, obj, size, errp);
  }
@@ -189,6 +191,17 @@ static bool forward_field_type_str(Visitor *v, const char *name, char **obj,
      return visit_type_str(ffv->target, name, obj, errp);
  }
  
+static bool forward_field_type_size(Visitor *v, const char *name, uint64_t *obj,
+                                    Error **errp)
+{
+    ForwardFieldVisitor *ffv = to_ffv(v);
+
+    if (!forward_field_translate_name(ffv, &name, errp)) {
+        return false;
+    }
+    return visit_type_size(ffv->target, name, obj, errp);
+}
+
  static bool forward_field_type_number(Visitor *v, const char *name, double *obj,
                                        Error **errp)
  {
@@ -275,6 +288,12 @@ Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to
  {
      ForwardFieldVisitor *v = g_new0(ForwardFieldVisitor, 1);
  
+    /*
+     * Clone and dealloc visitors don't use a name for the toplevel
+     * visit, so they make no sense here.
+     */
+    assert(target->type == VISITOR_OUTPUT || target->type == VISITOR_INPUT);
+
      v->visitor.type = target->type;
      v->visitor.start_struct = forward_field_start_struct;
      v->visitor.check_struct = forward_field_check_struct;
@@ -285,18 +304,19 @@ Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to
      v->visitor.end_list = forward_field_end_list;
      v->visitor.start_alternate = forward_field_start_alternate;
      v->visitor.end_alternate = forward_field_end_alternate;
-    v->visitor.optional = forward_field_optional;
-    v->visitor.deprecated_accept = forward_field_deprecated_accept;
-    v->visitor.deprecated = forward_field_deprecated;
-    v->visitor.free = forward_field_free;
      v->visitor.type_int64 = forward_field_type_int64;
      v->visitor.type_uint64 = forward_field_type_uint64;
+    v->visitor.type_size = forward_field_type_size;
      v->visitor.type_bool = forward_field_type_bool;
      v->visitor.type_str = forward_field_type_str;
      v->visitor.type_number = forward_field_type_number;
      v->visitor.type_any = forward_field_type_any;
      v->visitor.type_null = forward_field_type_null;
+    v->visitor.optional = forward_field_optional;
+    v->visitor.deprecated_accept = forward_field_deprecated_accept;
+    v->visitor.deprecated = forward_field_deprecated;
      v->visitor.complete = forward_field_complete;
+    v->visitor.free = forward_field_free;
  
      v->target = target;
      v->from = g_strdup(from);
diff --git a/tests/unit/test-forward-visitor.c b/tests/unit/test-forward-visitor.c
index 32ba359977..0de43964d2 100644
--- a/tests/unit/test-forward-visitor.c
+++ b/tests/unit/test-forward-visitor.c
@@ -69,6 +69,33 @@ static void test_forward_any(void)
      qapi_free_UserDefOne(dst);
  }
  
+static void test_forward_size(void)
+{
+    /*
+     * visit_type_size does not return a pointer, so visit_with_forward
+     * cannot be used.
+     */
+    bool help = false;
+    QDict *src = keyval_parse("src=1.5M", NULL, &help, &error_abort);
+    Visitor *v, *alias_v;
+    Error *err = NULL;
+    uint64_t result = 0;
+
+    v = qobject_input_visitor_new_keyval(QOBJECT(src));
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+
+    alias_v = visitor_forward_field(v, "dst", "src");
+    visit_type_size(alias_v, "src", &result, &err);
+    error_free_or_abort(&err);
+    visit_type_size(alias_v, "dst", &result, &err);
+    assert(result == 3 << 19);
+    assert(err == NULL);
+    visit_free(alias_v);
+
+    visit_end_struct(v, NULL);
+    visit_free(v);
+}
+
  static void test_forward_number(void)
  {
      /*
@@ -157,6 +184,7 @@ int main(int argc, char **argv)
      g_test_add_func("/visitor/forward/struct", test_forward_struct);
      g_test_add_func("/visitor/forward/alternate", test_forward_alternate);
      g_test_add_func("/visitor/forward/string", test_forward_string);
+    g_test_add_func("/visitor/forward/size", test_forward_size);
      g_test_add_func("/visitor/forward/number", test_forward_number);
      g_test_add_func("/visitor/forward/any", test_forward_any);
      g_test_add_func("/visitor/forward/list", test_forward_list);


