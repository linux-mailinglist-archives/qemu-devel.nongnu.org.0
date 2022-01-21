Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49880495FD7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:34:59 +0100 (CET)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAu4A-0005Sv-2G
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:34:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1nAtWe-00080S-KS
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:00:23 -0500
Received: from mail-108-mta91.mxroute.com ([136.175.108.91]:44737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1nAtWb-00080N-O4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:00:19 -0500
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta91.mxroute.com (ZoneMTA) with ESMTPSA id 17e7cb861e3000bdf2.001
 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Fri, 21 Jan 2022 12:59:25 +0000
X-Zone-Loop: 2faa88d215bb6748b0c914af311cad163919c2b9356b
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:Content-Type:From:
 In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Idd7wUsAFMvkEpmSLuK5TGWFwjMD3A96Nxi6QKEX+g=; b=Ko2gNqpAU1rzyfL6I7tWoHFImB
 1aC9xYuF7CZ7j/NvgDmBYHTBeAH975cnLlT6x3YGgnr5GVdLKHjirW0fPQ0vofIeIvOLpJ+mR4Pv3
 ZpyLoeOFCSq6VGIShVZsrwTy5desoyUtgo94CBFyQ5UeY7fc63Mwnsc10DMGL1OJCI2TMC3q5LytC
 hNucB1o5YlxQ1l17MuMcK6VUhOwfOrBCn5FPhe/8tR30hRDcCjqdWp/jxXlyYrrvwrmUk5hKKrK80
 T1MccsBmsfjJUfP3Hju6tqd8IFfKggQffrORVdxVUVVk5XbiswYhQ45sp7V3WVJbTVIOeLbMD62pT
 Th9xjkkw==;
Message-ID: <45fba3c2-11b8-7710-95ee-859f09aea332@mkfssion.com>
Date: Fri, 21 Jan 2022 20:59:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] vl: Add support to set properties when using JSON
 syntax for -device via -set option
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20211224072511.63894-1-mkfssion@mkfssion.com>
 <87iluflsxg.fsf@dusky.pond.sub.org>
In-Reply-To: <87iluflsxg.fsf@dusky.pond.sub.org>
From: MkfsSion <mkfssion@mkfssion.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AuthUser: mkfssion@mkfssion.com
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=-0.1, required=15, tests=[ARC_NA=0,
 TO_DN_ALL=0, FROM_HAS_DN=0, RCPT_COUNT_THREE=0, MIME_GOOD=-0.1,
 FROM_EQ_ENVFROM=0, MIME_TRACE=0, RCVD_COUNT_ZERO=0, NEURAL_SPAM=0,
 MID_RHS_MATCH_FROM=0]
Received-SPF: pass client-ip=136.175.108.91;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta91.mxroute.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/1/19 22:08, Markus Armbruster wrote:
> MkfsSion <mkfssion@mkfssion.com> writes:
> 
>> When using JSON syntax for -device, -set option can not find device
>> specified in JSON by id field. The following commandline is an example:
>>
>> $ qemu-system-x86_64 -device '{"id":"foo"}' -set device.foo.bar=1
>> qemu-system-x86_64: -set device.foo.bar=1: there is no device "foo" defined
>>
>> The patch fixes the above issue by trying to convert value provided by -set
>> option to the type that the setting property actually takes.
>>
>> Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
>> ---
>>  v2:
>>      1.Set device option when group is 'device' only
>>      2.Store value in type that properties actually take
> 
> 2. is an attempt to fix the issue I pointed out in review of v1
> (example output corrected in places):
> 
>     Issue#2 is the value to store in @device_opts.  Always storing a string,
>     like in the QemuOpts case, would be wrong, because it works only when
>     its accessed with visit_type_str(), i.e. the property is actually of
>     string type.
> 
>     Example:
> 
>         $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.serial=123
> 
>         $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.msos-desc=off
>         qemu-system-x86_64: -device {"driver": "usb-mouse", "id": "ms0"}: Invalid parameter type for 'msos-desc', expected: boolean
> 
>     Your patch stores a boolean if possible, else a number if possible, else
>     a string.  This is differently wrong.
> 
>     [...]
> 
>     Example:
> 
>         $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.serial=123
>         qemu-system-x86_64: -device {"driver": "usb-mouse", "id": "ms0"}: Invalid parameter type for 'serial', expected: string
> 
>     I can't see how -set can store the right thing.
> 
> See code below.
> 
>     Aside: the error messages refer to -device instead of -set.  Known bug
>     in -set, hard to fix.
> 
>>
>>
>>  softmmu/vl.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 620a1f1367..c213e9e022 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -30,7 +30,9 @@
>>  #include "hw/qdev-properties.h"
>>  #include "qapi/compat-policy.h"
>>  #include "qapi/error.h"
>> +#include "qapi/qmp/qbool.h"
>>  #include "qapi/qmp/qdict.h"
>> +#include "qapi/qmp/qnum.h"
>>  #include "qapi/qmp/qstring.h"
>>  #include "qapi/qmp/qjson.h"
>>  #include "qemu-version.h"
>> @@ -2274,6 +2276,61 @@ static void qemu_read_default_config_file(Error **errp)
>>      }
>>  }
>>  
>> +static bool qemu_set_device_option_property(const char *id, const char *key,
>> +                                            const char *value, Error **errp) {
>> +    DeviceOption *opt;
>> +    QTAILQ_FOREACH(opt, &device_opts, next) {
>> +        const char *device_id = qdict_get_try_str(opt->opts, "id");
>> +        if (device_id && (strcmp(device_id, id) == 0)) {
>> +            QObject *obj = NULL;
>> +            if ((strcmp(key, "id") == 0) ||
>> +                (strcmp(key, "bus") == 0) ||
>> +                (strcmp(key, "driver") == 0)) {
>> +                obj = QOBJECT(qstring_from_str(value));
> 
> Special case, because these are not QOM properties.  Similarly
> special-cased in qdev_device_add_from_qdict().  Okay.
> 
>> +            } else {
>> +                const char *driver = qdict_get_try_str(opt->opts, "driver");
>> +                if (driver) {
>> +                    ObjectClass *klass = object_class_by_name(driver);
> 
> This may fail.
> 
>> +                    ObjectProperty *prop = object_class_property_find(klass, key);
> 
> If it does, this crashes:
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -device '{"driver": "nonexistent", "id": "foo"}' -set device.foo.bar=42
>     Segmentation fault (core dumped)
> 
>> +                    if (prop) {
>> +                        if (strcmp(prop->type, "str") == 0) {
>> +                            obj = QOBJECT(qstring_from_str(value));
>> +                        } else if (strcmp(prop->type, "bool") == 0) {
>> +                            bool boolean;
>> +                            if (qapi_bool_parse(key, value, &boolean, errp)) {
>> +                                obj = QOBJECT(qbool_from_bool(boolean));
>> +                            }
>> +                        } else if (strncmp(prop->type, "uint", 4) == 0) {
>> +                            uint64_t num;
>> +                            if (parse_option_size(key, value, &num, errp)) {
>> +                                obj = QOBJECT(qnum_from_uint(num));
>> +                            }
>> +                        } else {
>> +                            error_setg(errp,
>> +                                       "Setting property %s on device %s with "
>> +                                       "type %s is unsupported via -set option",
>> +                                       key, id, prop->type);
>> +                        }
> 
> This guesses based on prop->type.  Unfortunately, its values are a mess.
> They are documented in qom.json:
> 
>     # @type: the type of the property.  This will typically come in one of four
>     #        forms:
>     #
>     #        1) A primitive type such as 'u8', 'u16', 'bool', 'str', or 'double'.
>     #           These types are mapped to the appropriate JSON type.
>     #
>     #        2) A child type in the form 'child<subtype>' where subtype is a qdev
>     #           device type name.  Child properties create the composition tree.
>     #
>     #        3) A link type in the form 'link<subtype>' where subtype is a qdev
>     #           device type name.  Link properties form the device model graph.
> 
> I like that it says "one of four", then lists three.  Fair warning to
> the reader not to trust this.
> 
> In fact, 1) is aspirational.  The value is whatever C code passes to
> object_property_add().  Actually values include "bool", "int", "int32",
> "size", "string", "uint16", "uint32", "uint64", "uint8",
> "GuestPanicInformation", "QemuUUID", "X86CPUFeatureWordInfo", my
> favorites "container", "guest statistics", "struct tm", and my special
> favorite "struct".
> 
> Your code recognizes only some values we actually use.  Even if it
> recognized all, keeping it that way would be an impossible mission.
> 
> It parses (unsigned) integers with parse_option_size().  Apropriate only
> sometimes.
> 
> The patch covers only -device.  We've extended more options from just
> QemuOpts (where -set works) to also JSON (where it doesn't),
> e.g. -object.  More to come.
> 
> This is more elaborate guesswork than v1, but it's still guesswork, and
> still incomplete.
> 
> I don't think we should try to make -set work when using JSON arguments.
Thanks for your detailed review.
The following is my opinion towards implementing -set option for JSON arguments.
Having -set option worked for JSON argument improved compatability with libvirt (libvirt has switched to use JSON arguments for device by default). -set option is useful for libvirt user as libvirt doesn't support all functionality that QEMU provides.
I have another idea for implementing this feature which seems addressed the above issue. We can implement this feature by add new parameter that refers to options provided by -set option to qdev_device_add_from_qdict() (This api seems is not widely used in QEMU tree) function and use old qobject_input_visitor_new() visitor for setting them.
Do you think is OK to implement this feature in that way?
Best wishes,
YuanYang Meng
> 
> 
>> +                    } else {
>> +                        error_setg(errp, "Unable to find property %s on device %s",
>> +                                   key, id);
>> +                    }
>> +                } else {
>> +                    error_setg(errp, "Unable to get driver for device %s", id);
> 
> Masks the real error.
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -device '{"id": "foo"}' -set device.foo.bar=42
>     qemu-system-x86_64: -set device.foo.bar=42: Unable to get driver for device foo
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -device '{"id": "foo"}'
>     qemu-system-x86_64: -device {"id": "foo"}: Parameter 'driver' is missing
> 
>> +                }
>> +            }
>> +            if (obj) {
>> +                qdict_del(opt->opts, key);
>> +                qdict_put_obj(opt->opts, key, obj);
>> +                return true;
>> +            } else {
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>>  static void qemu_set_option(const char *str, Error **errp)
>>  {
>>      char group[64], id[64], arg[64];
>> @@ -2294,6 +2351,11 @@ static void qemu_set_option(const char *str, Error **errp)
>>          if (list) {
>>              opts = qemu_opts_find(list, id);
>>              if (!opts) {
>> +                if (strcmp(group, "device") == 0) {
>> +                    if (qemu_set_device_option_property(id, arg,
>> +                                                        str + offset + 1, errp))
>> +                        return;
>> +                }
>>                  error_setg(errp, "there is no %s \"%s\" defined", group, id);
>>                  return;
>>              }
> 

