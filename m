Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE235E374
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:06:04 +0200 (CEST)
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLYB-0002Ct-Hl
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOd-0001WN-Rt
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOZ-0000Ba-KD
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618329366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIfCrRGZsQcxyjJLMuy+Tn71Ybe8bopsExGO/vtKykY=;
 b=bgak2QpUS2wL8uOaAP+svWD4Eb93oYsxeEfWHgxXMIZFrJee4wW+qxwfYmQMlzSzzrK/Ko
 eUE8AzwUv1JaPJd5JIqIVyqUtoI/SY7ZTZjRv4Mys9vNGL3LsyLZRTke4C/pUhLTPrbF2B
 MLUFizn9SoU4Dvdb/7CVIvznu8vwVao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-r7QJUgH3NouA1pfwAbTTag-1; Tue, 13 Apr 2021 11:56:04 -0400
X-MC-Unique: r7QJUgH3NouA1pfwAbTTag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 683E28710F4
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 15:56:03 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F2BD6A034;
 Tue, 13 Apr 2021 15:56:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 5/7] models: Add well-known QMP objects
Date: Tue, 13 Apr 2021 11:55:51 -0400
Message-Id: <20210413155553.2660523-6-jsnow@redhat.com>
In-Reply-To: <20210413155553.2660523-1-jsnow@redhat.com>
References: <20210413155553.2660523-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: crosa@redhat.com, John Snow <jsnow@redhat.com>, ehabkost@redhat.com,
 stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This uses the third-party pydantic library to provide grammatical
validation of various JSON objects used in the QMP protocol, along with
documentation that references where these objects are defined.

This is done both to ensure that objects conform to the standard set
forth in the QMP specification, and to provide a strict type-safe
interface that can be used to access information sent by the server in a
type-safe way.

If you've not run into pydantic before, you define objects by creating
classes that inherit from BaseModel. Then, similar to Python's own
@dataclass format, you declare the fields (and their types) that you
expect to see in this object. Pydantic will then automatically generate
a parser/validator for this object, and the end result is a strictly
typed, native Python object that is guaranteed to have the fields
specified.

NOTE: Pydantic does not, by default, ensure that *extra* fields are not
present in the model. This is intentional, as it allows backwards
compatibility if new fields should be added to the specification in the future.

This strictness feature, however, *can* be added. A debug/strict mode
could be added (but is not present in this RFC) to enable that
strictness on-demand, but for a general-purpose client it's likely best
to leave that disabled.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 models.py | 177 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100644 models.py

diff --git a/models.py b/models.py
new file mode 100644
index 0000000..7c42d47
--- /dev/null
+++ b/models.py
@@ -0,0 +1,177 @@
+"""
+QMP message models.
+
+This module provides definitions for several well-defined JSON object
+types that are seen in the QMP wire protocol. Using pydantic, these
+models also handle the parsing and validation of these objects in order
+to provide strict typing guarantees elsewhere in the library.
+
+Notably, it provides these object models:
+
+- `Greeting`: the standard QMP greeting message (and nested children)
+- Three types of server RPC response messages:
+  - `ErrorResponse`: A failed-execution reply. (Application-level failure)
+  - `SuccessResponse`: A successful execution reply.
+  - `ParsingError`: A reply indicating the RPC message was not understood.
+                  (Library-level failure, or worse.)
+- A special pydantic form of the above three; `ServerResponse`,
+  used to parse incoming messages.
+- `AsynchronousEvent`: A generic event message.
+"""
+
+from typing import (
+    Any,
+    Dict,
+    List,
+    Type,
+    TypeVar,
+    Union,
+)
+
+from pydantic import BaseModel, Field, root_validator, ValidationError
+
+
+from message import Message, ObjectTypeError
+
+
+class MessageBase(BaseModel):
+    """
+    An abstract pydantic model that represents any QMP object.
+
+    It does not define any fields, so it isn't very useful as a type.
+    However, it provides a strictly typed parsing helper that allows
+    us to convert from a QMP `Message` object into a specific model,
+    so long as that model inherits from this class.
+    """
+    _T = TypeVar('_T', bound='MessageBase')
+
+    @classmethod
+    def parse_msg(cls: Type[_T], obj: Message) -> _T:
+        """
+        Convert a `Message` into a strictly typed Python object.
+
+        For Messages that do not pass validation, pydantic validation
+        errors are encapsulated using the `ValidationError` class.
+
+        :raises: ValidationError when the given Message cannot be
+                 validated (and converted into) as an instance of this class.
+        """
+        try:
+            return cls.parse_obj(obj)
+        except ValidationError as err:
+            raise ObjectTypeError("Message failed validation.", obj) from err
+
+
+class VersionTriple(BaseModel):
+    """
+    Mirrors qapi/control.json VersionTriple structure.
+    """
+    major: int
+    minor: int
+    micro: int
+
+
+class VersionInfo(BaseModel):
+    """
+    Mirrors qapi/control.json VersionInfo structure.
+    """
+    qemu: VersionTriple
+    package: str
+
+
+class QMPGreeting(BaseModel):
+    """
+    'QMP' subsection of the protocol greeting.
+
+    Defined in qmp-spec.txt, section 2.2, "Server Greeting".
+    """
+    version: VersionInfo
+    capabilities: List[str]
+
+
+class Greeting(MessageBase):
+    """
+    QMP protocol greeting message.
+
+    Defined in qmp-spec.txt, section 2.2, "Server Greeting".
+    """
+    QMP: QMPGreeting
+
+
+class ErrorInfo(BaseModel):
+    """
+    Error field inside of an error response.
+
+    Defined in qmp-spec.txt, section 2.4.2, "error".
+    """
+    class_: str = Field(None, alias='class')
+    desc: str
+
+
+class ParsingError(MessageBase):
+    """
+    Parsing error from QMP that omits ID due to failure.
+
+    Implicitly defined in qmp-spec.txt, section 2.4.2, "error".
+    """
+    error: ErrorInfo
+
+
+class SuccessResponse(MessageBase):
+    """
+    Successful execution response.
+
+    Defined in qmp-spec.txt, section 2.4.1, "success".
+    """
+    return_: Any = Field(None, alias='return')
+    id: str  # NB: The spec allows ANY object here. AQMP does not!
+
+    @root_validator(pre=True)
+    @classmethod
+    def check_return_value(cls,
+                           values: Dict[str, object]) -> Dict[str, object]:
+        """Enforce that the 'return' key is present, even if it is None."""
+        # To pydantic, 'Any' means 'Optional'; force its presence:
+        if 'return' not in values:
+            raise TypeError("'return' key not present in object.")
+        return values
+
+
+class ErrorResponse(MessageBase):
+    """
+    Unsuccessful execution response.
+
+    Defined in qmp-spec.txt, section 2.4.2, "error".
+    """
+    error: ErrorInfo
+    id: str  # NB: The spec allows ANY object here. AQMP does not!
+
+
+class ServerResponse(MessageBase):
+    """
+    Union type: This object can be any one of the component messages.
+
+    Implicitly defined in qmp-spec.txt, section 2.4, "Commands Responses".
+    """
+    __root__: Union[SuccessResponse, ErrorResponse, ParsingError]
+
+
+class EventTimestamp(BaseModel):
+    """
+    Timestamp field of QMP event, see `AsynchronousEvent`.
+
+    Defined in qmp-spec.txt, section 2.5, "Asynchronous events".
+    """
+    seconds: int
+    microseconds: int
+
+
+class AsynchronousEvent(BaseModel):
+    """
+    Asynchronous event message.
+
+    Defined in qmp-spec.txt, section 2.5, "Asynchronous events".
+    """
+    event: str
+    data: Union[List[Any], Dict[str, Any], str, int, float]
+    timestamp: EventTimestamp
-- 
2.30.2


